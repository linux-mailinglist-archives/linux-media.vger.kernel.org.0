Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9502B52A8
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732903AbgKPUd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:33:57 -0500
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com ([40.107.244.68]:13824
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726426AbgKPUd4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:33:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4xFsfn4NentCtH9eyhFyUXZTvjy6lT5oKwUdmw0+BwhS8flictI8Maqa+OOATGccHYIkXsx6/n6nFG7Iz1jnhsWBoASgpytyxxYUsWxdw39zED4jNvX6Pa67Q2glRLzUbI4j+TroPs//QVbqeXiakTP6HIjaM27N00CX2qwyy9NpEPhiLfOsAmhVU/BrkFnbIbzIDWsqI63ih+racv0a/Dn76asWJZecbdmEX0ZHlpqHf5raLc+QI4fue3Py+rdX00zmphO9nty2MP3IOKHU/Y/zQpXlkbCxpJy7wXhdxgKEjxQR8i/fWOhIl7j2fNs/anFhj4faonl3dmP6oM0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC0kR/ywQkt9nbwb6YckcshvS8ncYTpcZcAHxvSkkSU=;
 b=ILEHS2lOO0DsMMUs3CvRy8i1SO37kr0Ao+8m6QrUmk5h2CwVAt8HFQRVLeE0l7z0BmlXh/kyZzDlfYJPHNjj42M6VO4VUI/YcKXI9HQqwOTtgWCdC35LjKSoKAT+/gFAt31fZRiQ6Sr/NKPdraPOGS+51NoTcqmYJ1MB/Y8BOS39qUHMJnZ0V6rODXD9RGPwHXxWUjtwnT5caWPhAktg7a+8sZ/M07Gbd0iRd62q7kyxZgz+bzTL/m/iBlGXI8fJmwLewK+KBWzL37mG75UIAgzZN4KkMfl6bFa7tf5eYiExT2W1TxFcWEluxX91r6SCGCcWmB/ZxFBu0i0z+JOV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC0kR/ywQkt9nbwb6YckcshvS8ncYTpcZcAHxvSkkSU=;
 b=SGp68G8APfldOyH9N50hjQLLwFjVOdgkPv4bLeWUEXIKvp5qS6+zgA+FMprE5wPDU0Hxjvh7orVhNjxNM1eYAvRxGTj1l6RkzIYAW8lxyhBYRJf5YPAboOFa5eJEIrOE3FSy3UHrj9/k+vWulfNIRhO3HufdEojlkpSJkvtzasA=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 20:33:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 20:33:54 +0000
Subject: Re: [PATCH 31/42] drm/ttm/ttm_bo: Fix one function header - demote
 lots of kernel-doc abuses
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-32-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7745c8a0-12ad-8dcd-3740-51c640ea4ef2@amd.com>
Date:   Mon, 16 Nov 2020 21:33:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201116174112.1833368-32-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:200:9b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 20:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d83f14df-5eba-41d2-55ad-08d88a6eef21
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49616BC08345A59ADBCD5A1D83E30@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8RrwoAHOQDwVXfg+hRvSYJcIQIuoRaVE5xH7rd5uPPeh+w9YKG1kFJmHDhK93HB1hKu06jsHr5hqh0vDdcnyeAg+Rw2B7d8eBQfQmmW5GkvjWsaC3O/RvGndl+aH5toUYK9KMP8HkScQerDa1R+bpWaNTNG309e0Ofgo09XXw7QdXkAe13fhh2wYT9k0yU0xQ3CRK7Pt322xFGuWRhaLdGG4PPvwBEzrfRiz47s7MUd/kHcUArWYKWN/kfD2/jAW5Bi5N6M3FtuHf3d8qddvCdkwRZjwBUoEg424BWePDSF9yBQp/A0T6oI3trst/K0NLILIs69o4/vnAB46R8kGzz46JDH3iDWVFEwS1SLj6PkVZZxzzZxJz6cZeH00T8k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(186003)(16526019)(8936002)(6916009)(8676002)(6486002)(66574015)(66946007)(54906003)(66556008)(66476007)(52116002)(6666004)(31686004)(36756003)(83380400001)(478600001)(4326008)(86362001)(2906002)(31696002)(2616005)(5660300002)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bENqaEVwbytiYUlzclB0dkFSR0RJelU5bjNXNlhTNVM3Q2FTN2JYbnowbEdI?=
 =?utf-8?B?Y0cxRTFXZHNhSHhjVmFrV2NTMGlna0FLOEJvZVNkYVNvL3BjZ1lQOTN4cWdR?=
 =?utf-8?B?VTkzV1ZYUWlyWnV6bDVFR3JnL2Foa1pxSkc1VllIYjJGZEY5a0J2YWZaNWZr?=
 =?utf-8?B?N2dGMDR5M0M3R01ZcUhDWGtJa1hYem04Q1RGSi83ajZHNm5xVzFxay9HbU9P?=
 =?utf-8?B?aE5jaXo3OWFyRVVMaEFaclA0QWduREt1V21scFNQd0JZRS9VcEVIZmo0OXZp?=
 =?utf-8?B?T1o1ZjRGZTFKRUIwajA3QzNLd3l5U3lQSjRzQm5rdHBxWXlueHdrMVh3ZjVx?=
 =?utf-8?B?dXBkWmdiSVFidlhlajkycHNvTHdxUEZvZkNXM05oSERqNEdma1BPOTJ6dVZC?=
 =?utf-8?B?SjkxWDJpOG0wZFdhU0FNVXlPTytGTmU1SFRVUGNOcUV4SGhvcnlITDRxcjNW?=
 =?utf-8?B?bG9EcDg1WUVMS3EwY2VDdU1pcGVSRG1hcmJnT3VYaGdsemN0ZS9uTHpJYlJw?=
 =?utf-8?B?M3J6eEZWQ3FZTFNGNTVqK1BZazdNcER0YUlWTjRzRjIyOVhpUXJ1WXNDd3h0?=
 =?utf-8?B?QUdDeWg0ZXd2b0ZxNkJoRUlLZ1lPaUU0T2lSNFROY0xnay9mcmJRamM2M1du?=
 =?utf-8?B?MkphZ2JnNlorT2NQbHloanpBS0JMdDBmQVFQTy9JaU9RclN6MDhjM25MSndh?=
 =?utf-8?B?WTc4blR3YXA1NmRPajlKVGJLWVY2R1oxR2RWQVVIcThXWkluV1RNSFMzZ3Aw?=
 =?utf-8?B?MkpEWkhMUHZzUk1TUGRrME0wKzNSdE5KbERCYmtIUUp5SERtQ0ZOTnczZVJI?=
 =?utf-8?B?SmptVWJRK0hOd2FxdHl6YzkzelpUR1JsY0VIbFZXR1Byd2lDZ0JKdnBScHlF?=
 =?utf-8?B?TDNpT1lTZ09sNGJqWWdDWEs0TXRneGRZQnhrRTN1cm1uZGNxQ09iU1ZjeTdS?=
 =?utf-8?B?bkxZbW9URFB2eUlxeVlLdlJMUWQxTUQ4S1dYa0d5RUpoVFU3aUFKVGRKV0Zt?=
 =?utf-8?B?UTVpT2h3TFc1R1NBZDVsVk10cURxUlZkdjkwU2dXVERBUmJCblowL1lKRkhY?=
 =?utf-8?B?WkNRMEdmZ084ektXdENEczQ2UjJoRzBQdHoyeTk2OEphQTV6a0ovdFBhVm5G?=
 =?utf-8?B?L1l3N1pMTFpuL012ZFlEOVM0dHY1eDgrajJlbUF4bnVMdWpZZEJ5VEVZZWNm?=
 =?utf-8?B?Y2RYY3NnVS8xd0R2eWd3SUd3NzVWZUdNS1JzTEVIK1ZpRThpN00vOW9DUTVu?=
 =?utf-8?B?eW1pVUNpNFQ2eVJMOS9GYXhnY0tkcEF3eVdSL2U0b205QjhGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83f14df-5eba-41d2-55ad-08d88a6eef21
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 20:33:53.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cq4IqeYiAGwECr5qNDIH9+FbHcrNKCt/FDT3gKWO75ZHyrvUxVW2Bm2B21TA1WLR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.11.20 um 18:41 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or member 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
>   drivers/gpu/drm/ttm/ttm_bo.c:286: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_memtype_use'
>   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_refs'
>   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'interruptible' not described in 'ttm_bo_cleanup_refs'
>   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
>   drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'unlock_resv' not described in 'ttm_bo_cleanup_refs'
>   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'bdev' not described in 'ttm_bo_delayed_delete'
>   drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'remove_all' not described in 'ttm_bo_delayed_delete'
>   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'bo' not described in 'ttm_bo_evict_swapout_allowable'
>   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'ctx' not described in 'ttm_bo_evict_swapout_allowable'
>   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'locked' not described in 'ttm_bo_evict_swapout_allowable'
>   drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'busy' not described in 'ttm_bo_evict_swapout_allowable'
>   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'bo' not described in 'ttm_bo_add_move_fence'
>   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'man' not described in 'ttm_bo_add_move_fence'
>   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'mem' not described in 'ttm_bo_add_move_fence'
>   drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
>   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_force_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'place' not described in 'ttm_bo_mem_force_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_force_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_force_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:1387: warning: Function parameter or member 'ctx' not described in 'ttm_bo_swapout'
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to pick that one up for upstreaming.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e6bcbfe530ecc..9a03c7834b1ed 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -45,7 +45,7 @@
>   
>   static void ttm_bo_global_kobj_release(struct kobject *kobj);
>   
> -/**
> +/*
>    * ttm_global_mutex - protecting the global BO state
>    */
>   DEFINE_MUTEX(ttm_global_mutex);
> @@ -278,7 +278,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   	return ret;
>   }
>   
> -/**
> +/*
>    * Call bo::reserved.
>    * Will release GPU memory type usage on destruction.
>    * This is the place to put in driver specific hooks to release
> @@ -352,9 +352,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>    * Must be called with lru_lock and reservation held, this function
>    * will drop the lru lock and optionally the reservation lock before returning.
>    *
> - * @interruptible         Any sleeps should occur interruptibly.
> - * @no_wait_gpu           Never wait for gpu. Return -EBUSY instead.
> - * @unlock_resv           Unlock the reservation lock as well.
> + * @bo:                    The buffer object to clean-up
> + * @interruptible:         Any sleeps should occur interruptibly.
> + * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> + * @unlock_resv:           Unlock the reservation lock as well.
>    */
>   
>   static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> @@ -420,7 +421,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   	return 0;
>   }
>   
> -/**
> +/*
>    * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
>    * encountered buffers.
>    */
> @@ -628,7 +629,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> -/**
> +/*
>    * Check the target bo is allowable to be evicted or swapout, including cases:
>    *
>    * a. if share same reservation object with ctx->resv, have assumption
> @@ -767,7 +768,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>   	return ret;
>   }
>   
> -/**
> +/*
>    * Add the last move fence to the BO and reserve a new shared slot.
>    */
>   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> @@ -803,7 +804,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   	return 0;
>   }
>   
> -/**
> +/*
>    * Repeatedly evict memory from the LRU for @mem_type until we create enough
>    * space, or we've evicted everything and there isn't enough space.
>    */
> @@ -865,7 +866,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
>   	return 0;
>   }
>   
> -/**
> +/*
>    * Creates space for memory region @mem according to its type.
>    *
>    * This function first searches for free space in compatible memory types in
> @@ -1430,7 +1431,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_wait);
>   
> -/**
> +/*
>    * A buffer object shrink method that tries to swap out the first
>    * buffer object on the bo_global::swap_lru list.
>    */

