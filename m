Return-Path: <linux-media+bounces-45942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA9C1A98B
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 14:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E928D1A236F8
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 13:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6C52C0F6D;
	Wed, 29 Oct 2025 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zft4Qxvw"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990202C0291;
	Wed, 29 Oct 2025 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743179; cv=fail; b=LjdGSNPNnk2mf+5aEzm15dKVhmJfnpIC7bf3nieyp3PlAF9A8oY0FYay0NaZfHXr3lugPVtm6Uy7xA25y1spXhU9BfkbfyK+MeMn4NenQWFlcVgMgDtyPVEMO7GhdqY592XKorJTR+IAAduFHSXbpa6eEN4na31aPtIS0CKOSJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743179; c=relaxed/simple;
	bh=ef7ItYCPh2ACjIaTsBOM2fyPaMv7EPL23UroXHuwL5o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1v/Fv1kx7G+VXuc/den3S4pQvv98Umj+/nRGjducvBudzKPJRGUoLfd64m3FlZ3CFJuMzt3ukUyghfQfgtxZY7G3nHOz7vC/o16ZcJh4gkIolEfVRlO6KppCDdm+GhT5T3jwxxejHg4TaD3TFRezLgX30rAEIL6siBNJlH5KxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zft4Qxvw; arc=fail smtp.client-ip=40.93.195.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpHiRrICScorsDZR1TAM6QFyGCahIT/2sI8iGMzFP7c2UnUlU6xoNdI21ueDMCR0SBMAQuT9ZEN5YxBx3o+Ty5eXRGKOgAx8bEqWAVur4D0kMa2PAKwv2EXs2OZ0eBo4OIyXteOgiHHyDhrFv+473WtfQkRnGvVA/eB1hmFKgYSxtYnYDl/Ll2ei3/6UXMPq8ccB1yreW+yazkI3KC99uM/HHZV0m5D528te4KZPWXK8R03p3Ci78coj5qOijLjzOS2WGE6YlpFSW3FTzjNzVydC+0bOvUfxo2M/jQyI8o9VuvvL1Z0dspTii9Vt5BtRcZUlpRj5l/w1Lv4xdS9uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUD4K93MdB174fcdB8IKFqMOqaAJRd4EEq2I1yI7zhA=;
 b=c6eWOf6+JSMkvSJI1tImBUyckD+Rlu8vwXgtvzJlyNnORByQkuDJA/exDSQoJYmh+eFiXjfsioDq5Ca7yRB4i+FXI0iCmmdvlLhPm5xILKpDkiDTKQ+btCNc2eHj+rkN836XVBsECAzvFuW7nipecdFh3T5geDU0wPhgKYnb6z8ET0s4BnaGESr2FyAdnQEbVcvQR8sCMgX5Fy9KgI7via5F73eBP5OTJ9Wnn1f7wPqXmnTs/ReSGtUplNWw8QwESvuI2qBO3+84wz5NKHDAM4jGv8dULOG/SdP1do7pyfDBZzmK5B8A1t0W0jjGUNv/h5Gi5pCxJ46pVHGLZP+hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUD4K93MdB174fcdB8IKFqMOqaAJRd4EEq2I1yI7zhA=;
 b=Zft4QxvwDrOqU2iTPXD+mKp9blK6sn0mF1q+wmDAW71YO8YN5BCH6LgrQC/YHIOvCuBHeUHQcG99Zfu2KU9lb6ENNShaJsFxUvi9w4hma0d4QB3l5BB0FFysLgqd4qqr3DrRLBuU89KtyBkZIqhhlbHV+dOaVSz9fEz8YBOaB3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 13:06:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 13:06:12 +0000
Message-ID: <a3f41155-3c32-40dd-b750-1023d94e2923@amd.com>
Date: Wed, 29 Oct 2025 14:05:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 61923fe9-a83a-451f-a67e-08de16ebef6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEN5bm9aN082M1NHNmRhemhpZ2hxTjNuZWJZSlZ4QzB2RFZmaGhnSWZVMGVD?=
 =?utf-8?B?L3drN3Z4ZElrRmZQK1Q3emsxV0JNY3ViWmQ4VVhFbCs5ZkljM1NvWnpXWXNG?=
 =?utf-8?B?Z1k4KzhmRmZHRVJjaHlNQ0xUM3VVS0o3Qkk2eFlmeXN5U1hjMXhNd3RxaUph?=
 =?utf-8?B?S3l6S0ZJeENXZU1DSU5oSlllZVFFUzVZcW8xZWxnMUZnUkViS2VVUjNiSy9I?=
 =?utf-8?B?YUgzcU1vWXVoN1VnK0VVQ3A3MTgwamZ1VWNTYXYvTHFHOExzcjhVcnBBSXR3?=
 =?utf-8?B?Q1UvdTJwOTRndmFZanBoQ1RHVDBvSkpaRnpIblB1bDIrRzRlZVRRUE5HMHpu?=
 =?utf-8?B?MDM5VnlSN2pnSmhQK3NxZWdGNWF2SGJiNk1sejlZdzBpM2Y2cmxMdTVMeEJM?=
 =?utf-8?B?aXlXSW5oVStCTCsyVmkwTUVvQTNQb0MvU1o4UStyTWlWTFJSSHVLQXkzRmlK?=
 =?utf-8?B?WC82YVMyV3pYK0ZnWmJDOStuQmNBNVBRVU5NRVJVWnhJWXlZK3lEU1dCRUNC?=
 =?utf-8?B?dlM1MXVyeXc5N0VQaDg5cGJqTnY1ejF1dHUvSHlmdFBkdzFiNHVKRVlIeWZx?=
 =?utf-8?B?b0JqVW5sNlZRdjB1U2NlY2c1bFc4NCtzUSt3UVJRQmcwdEcwZHRubWZ1cXVJ?=
 =?utf-8?B?T3c0a0VScHArTmpyZFNVaXE2Y0Rib3NVTk95Y2l1aGM5OGU4Z1JFSytNeE44?=
 =?utf-8?B?c29rbGlSbzlWanlLK1F2Y3VRMzROeFJnU1BjRTM5L09BQ3NYODNLZ3d6OEpo?=
 =?utf-8?B?dHRmRU1QL0lVK2trVkIyYUFRdk8rOUN5Q0VkeWFOazdJVUNmekxDTWRmUUl4?=
 =?utf-8?B?My9hSVhQUnUzUHIxekZONlM0VTF1b2swcWxyOFhzaWw0b0kvRTBYUm5lL1dO?=
 =?utf-8?B?SVpheklacUM0OXN1RVZIeUJjZ2JGWEt3Q1IvTFNWQ2RqVDFhaSt6M1hpVy9m?=
 =?utf-8?B?VzhVVnNSL2I3UjJXNlFmNmVGSUM5MUxkL1BSaTg5TTRJeitvVUFFeGhaVWtr?=
 =?utf-8?B?OU1BUXpDUCtrRjNYNWVRWitBZTYwVjJBWVhqRlludXRRc05xT2hSL28ydG9q?=
 =?utf-8?B?VHlMY2RiQ21NK3ZNUHBXelU5QjRGaXFIRHh3emJRN1pVbzRWQ3c0R1F6K1pF?=
 =?utf-8?B?dmc2Y29ac0tJTCtXZDllSzBFQWpud1ROQ3dCZU16OXlFTEhZUU5KcTdKMUdn?=
 =?utf-8?B?cm8yL0JFZld1SEJ6akJ2QTdUT1pFR2lVdm9QTkVZTFZlOFNMQ2lySHZrdkxn?=
 =?utf-8?B?YUZBS25MR1BMUDh1eUpPL25HL0I3SjRaeDhzZGx4b2wvbWQ5cStLRVkyeDEy?=
 =?utf-8?B?bW9VdDEyTXdJWFdpL0tIVVR6RFpPZjAwWFVaUm9iMklqTFRSVW1oRjU2MUdR?=
 =?utf-8?B?bXRoQ1ROaFJQSSs1bDZtWElWNWZnb1J4R1JLcy92ODNlNE9sdHA1ZnppTlA5?=
 =?utf-8?B?VlpPdGpYQWFTOXQ0Y3EzaU9iN01CUks3eXJOenR3N2lwc29RYjM5UExXZ2Nm?=
 =?utf-8?B?Nmtnc1BpV3RBY293cndTQmFRQjg3SVlvbE1NU0o5MUhwTzdZZEMreS8rY0JG?=
 =?utf-8?B?MWpZLzVzb3NJclZ4NG1LSFRMQUtvZG1zQVZNQlptOExpSG82K0IxVmMxTitq?=
 =?utf-8?B?Y253QjR6UGxCQjlYeTRja3U2MityZk5tZjNScmZOTnZsZm14TUdJZ1hnWW45?=
 =?utf-8?B?WHQwOGkxYTNwbmF2QTNJV1BsVzVCTHZYSnVVSnhGZThTc1hsRktobUFFWWhR?=
 =?utf-8?B?bnRvd3pRNFhZcERIWWJyTTVnTWpwR0o0T29RdGMzcnJwekVPNnEzdFYvZGtY?=
 =?utf-8?B?c3Z2cyt5cUpxaGlZUFhNbUQ1VW42aDF1SGJCY3Y3OGd1VW8rZkZEK3lkV2ov?=
 =?utf-8?B?eURIQUcycnliY0FaUTZKSDRWd1NLRlpwbm9oRmFRQzkvRzR1YVBsVkVBeXpI?=
 =?utf-8?Q?SLcUmMtxOWzl2teaW1WTL5bp5+pg/dds?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clpZSVEyV0w2VnA2K2hIOThDdFZUeDRPdlJSMVZJb3dYSTBqL1RFTXRXdk1m?=
 =?utf-8?B?SnNRSHJ4bE4wY3ZEcm5mdVBEOGd2RWgxa2l6VlFYMmpKTGRzMStqbjJJMUFG?=
 =?utf-8?B?N1BERzAvN3o1Y0poeU5KdnhoTEkrVDFneVFYUUl1a0JFbFpoOVYwQStxVDdt?=
 =?utf-8?B?M1NKVEF5aEFlMXQyWkxZWHlrL25PSU95OXYwTU96NENjS0lPT1NXcTYwZ3dD?=
 =?utf-8?B?aUVTcTVMRDhHVlU0RGZXbUZvKzduSEZDQTdNQzhLVTQyUHQ4ZEJCc0FOeFpr?=
 =?utf-8?B?SnpKeGczdm9leUZLWmR3TndsWTdrMDlHckwrLy9jV0NaclFKSmFTbTQ3bGdh?=
 =?utf-8?B?UDNQbXErdWhxYzBUZ3FCSTVRWnpFczRhOGwrQlhHclVmTGsrTEpkSnNyVVpJ?=
 =?utf-8?B?ZTErbnJsdHh1cE1lSVltOE92ak1OalNuUnA0UjMzQmdDQzRreE03L2F5RndC?=
 =?utf-8?B?eDRSdStIamxyV293SjdpUWxoRUM2QUlOWEszd0s1c1ZidHJoVjFOcm1KSFEy?=
 =?utf-8?B?d0RjTytkK2xmYWxGNzl5MWdKVkFTZCtoWkpWQXR1V2JramxBMmQrTFdncERR?=
 =?utf-8?B?RGF5STNxQkF4K2RUOEh6cTFQbXBpZmRBVGUzSk8zSUFLTGRYUUN3RkIyYW1T?=
 =?utf-8?B?MTl5bVgrRUdjM2lyUXMxTWFJZXhEZXk3b2d5eEtZYWJybGxFNGR6NDd6eDY5?=
 =?utf-8?B?OFQ4MEgzSFgyODcxTEo0bnRsUnJkRlBnNzFUdUFsZklKaUVYOExRd2VKSTQ5?=
 =?utf-8?B?SGx4d3J1c1VScUpTS096Tm8xQ0htRWFiZDJBQ2lTRG9mNHRERUxKSFBSS2s0?=
 =?utf-8?B?T1Vrdk1ZU2NEdDh5Mk1HZEJ4QiszcmFqVkRzVm9vMHl6OHBscm9MZE9tNllN?=
 =?utf-8?B?aDBibCswdlFtTXpkcGtxTnVuSnRUTGVsRm43R0phc1VTVzRBdks1NWxBcUEy?=
 =?utf-8?B?M0xoYjNwUk10TjRSQ2h4YS9CRjMvTlRXc3RQS1kwOVhkaVFiWjc0TDQ4Zm8w?=
 =?utf-8?B?NGZuTENVcGVpc3dXUlN3RzBaMkJKSmhOSmpCS1krcGU5YnN2WFBCSmJoZ3Rx?=
 =?utf-8?B?SXdpb3BSdEtQR1A3NUEvQkMxZmlVRkFsdThHOVJCM2RNdkpZMEJJUnN6MXM2?=
 =?utf-8?B?SGN3QWR4K1ZjUWhLQWh1UFBnUVIrVTdJSVdvbmY3RHZhSzgwNnZWa1h5K3lG?=
 =?utf-8?B?WGQ0aldGR0tHVmt0OExIanp1dWQxcy9BalRiK2JmNjJBc3E5NGliZmFkbitw?=
 =?utf-8?B?ZzJDeVJGNW92U3BEcWJRM1RkOUpHWFphcjRIZjRiMTFNV2tNQlNZZzNiT0o4?=
 =?utf-8?B?UGcwWUEvNjZqZEJFa2RLNlJNdTJ4azl5QUkzUXRPQVY3aWZuUTkwNnAyREhJ?=
 =?utf-8?B?bStHRlFuMTA1ZDNTSVMxdTVvSzZKOGE4cmMzMVVQZVcxQi9sY3RNaVVObzd2?=
 =?utf-8?B?OEJaVXBBaUVyc2JaUzA2RmxpUWZLUytrNVplWTg4QU9pMDFqNXNsZWM2dGgx?=
 =?utf-8?B?WTJJc0t0SGRrWjl2b0tzUmFvMXJDUTdvS2llb2M0SnducXJuYm11WllDQXdz?=
 =?utf-8?B?cVprLzQ2NzZwM1RvMDhpS0VtQTZWdXAwbjhqbjNHbGg0bktuaEdrYjc5YVN3?=
 =?utf-8?B?QjRWL3lXcU5ObEJkMWErWWV5YXR0K1ZzNDBjL2ZhK1VEb1Y0TGN6WXZtTUFN?=
 =?utf-8?B?RE0rR2dwMlpRMW0xOTFhcjUzcUIwVmszeUIyVXhqK1NjWkp2c2xTR3JUWkN3?=
 =?utf-8?B?MHdHd1h3eFl2dGRTQ29lTFdqYWpNMk5oYzFmUjVzdEErWkJkQUFUUFQ3M2FD?=
 =?utf-8?B?STE3WmFMSWJGTHFpQ2dTQnZ2ZVE4Sk5Xb0hsM1c3NjkzWDZIZjdKTEE5ZE9o?=
 =?utf-8?B?YUk3SzRBUFJpL2k4R3RESDM0T3NNRWZjZlI5YS9aOWdjVTRCZjdvN3NvV3pL?=
 =?utf-8?B?TFM4NEx5andiUUFxaVMwNENGdUVKYnFJUmJyalhrVG4vV2EwWmpYZWxhL0dm?=
 =?utf-8?B?amlpUW9HUlByeU1PTkpwdkFiVC9GdktMa1ppMFRVV1NEdkE0WWV3cE5UYWEz?=
 =?utf-8?B?TGhTc3ArdE9vb0RmY2tPNVpzM0k5S1hlQ1AvY010Z0p2L2FZTDFHYWRaaHBw?=
 =?utf-8?Q?pp+DSULJkxBHU86GaQeBAm8Mz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61923fe9-a83a-451f-a67e-08de16ebef6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 13:06:12.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4UT/FRrQ53XcvPniHPIsH6L/c6Exet4aMw2I+RcVwFadtlXfD2BatB2tatiyhPD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866

On 10/29/25 10:11, Pierre-Eric Pelloux-Prayer wrote:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908 pointed out
> a possible deadlock:
> 
> [ 1231.611031]  Possible interrupt unsafe locking scenario:
> 
> [ 1231.611033]        CPU0                    CPU1
> [ 1231.611034]        ----                    ----
> [ 1231.611035]   lock(&xa->xa_lock#17);
> [ 1231.611038]                                local_irq_disable();
> [ 1231.611039]                                lock(&fence->lock);
> [ 1231.611041]                                lock(&xa->xa_lock#17);
> [ 1231.611044]   <Interrupt>
> [ 1231.611045]     lock(&fence->lock);
> [ 1231.611047]
>                 *** DEADLOCK ***
> 
> My initial fix was to replace xa_erase by xa_erase_irq, but Christian
> pointed out that calling dma_fence_add_callback from a callback can
> also deadlock if the signalling fence and the one passed to
> dma_fence_add_callback share the same lock.
> 
> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index c8e949f4a568..fe174a4857be 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>  }
>  EXPORT_SYMBOL(drm_sched_entity_error);
>  
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					  struct dma_fence_cb *cb);
> +
>  static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>  {
>  	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
> -
> -	drm_sched_fence_scheduled(job->s_fence, NULL);
> -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> -	WARN_ON(job->s_fence->parent);
> -	job->sched->ops->free_job(job);
> -}
> -
> -/* Signal the scheduler finished fence when the entity in question is killed. */
> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> -					  struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> -						 finish_cb);
> +	struct dma_fence *f;
>  	unsigned long index;
>  
> -	dma_fence_put(f);
> -
>  	/* Wait for all dependencies to avoid data corruptions */
>  	xa_for_each(&job->dependencies, index, f) {
>  		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
> @@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  		dma_fence_put(f);
>  	}
>  
> +	drm_sched_fence_scheduled(job->s_fence, NULL);
> +	drm_sched_fence_finished(job->s_fence, -ESRCH);
> +	WARN_ON(job->s_fence->parent);
> +	job->sched->ops->free_job(job);
> +}
> +
> +/* Signal the scheduler finished fence when the entity in question is killed. */
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					  struct dma_fence_cb *cb)
> +{
> +	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> +						 finish_cb);
> +
> +	dma_fence_put(f);
> +
>  	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>  	schedule_work(&job->work);
>  }


