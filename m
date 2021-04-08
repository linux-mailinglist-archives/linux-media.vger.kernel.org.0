Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903B6357FFF
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhDHJ4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:56:18 -0400
Received: from mail-eopbgr690041.outbound.protection.outlook.com ([40.107.69.41]:48645
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230291AbhDHJ4R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 05:56:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ozgq6BDxEtaChAwKalfJtqsK6eqEyB4BmUlor+1gZoemX9xVQiOCkk4GXfMZuoO4pIX+BROZlX2B6aTSy2pfTvt/C+1dmI8/RJeVoU750pW3xn5m4FYP2r2uFYxz+1TNi4aN1igcXx/wASwuwskpcMzjVg3amCrVSgJZeMz3RTjY6d9Nju/pzrpHtLfejTM7vIh7hJDvGfE5ROebq1E5cZdxabPd5syRnOQ7QXVfE3NJ+Bpu01KxmvckufgzdnlYXgoG0RkYTAONYV2JgfJAiNRrhhChhjjTxYmXYSy9sN0JKXSwVpfBh4GDzTkyMF3h5WFw0bro+l2KhsWIOSuB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIMTf1OMUUwb8zclzhE75sJ733gOLCz0B4NOGx8Lb1Y=;
 b=f0rTuIZ+/PCfmt0SOQqZednKbNhD4UONXg6QAOC/Mg/ZWWClpsm8ThV16bcEEtIrcGsHzXliadEX6LrFQBRpYO57xT7y5zeZLMeob/9WXy6Hq9LXfU9MOP9Yi2l6oNt3unLzBqQuiXSSocaWEzr6Proad6WZY6RfMEMPuZoiRz1cTUOOTyhGn4z0gG3p5V9V63zeVrCXVr1tHpE2aqOsEclij1uoTSjY8jUFzWUllJg3AqS8xUtF5g4om3ZRsAjJFaB32qukjrM8b6liI4XDoxqxMuqeeb+uYjppiKPCtCvKtl7Zt6VdSO3ufxnYE6EVf6qkiVo5laj4orazsyATqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIMTf1OMUUwb8zclzhE75sJ733gOLCz0B4NOGx8Lb1Y=;
 b=2BFSUnBRI7vLl6wK30bi+f4qIq5aKPvh5duEinMrR4ZA8+pyuwSTHDytiZ2zT1Dhc2B0/QRKi+o0wWT0VS6nZEM8ccR6Cq+CYinCfln8eSHPzhCQ2cB25J9vMggAP+zSpu9YlT7Uvvn9eOH2jTOGeNfre5J6m83jM/SXhMShIq4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2450.namprd12.prod.outlook.com (2603:10b6:207:4d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 09:56:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 09:56:04 +0000
Subject: Re: [PATCH v3] drm/syncobj: use newly allocated stub fences
To:     David Stevens <stevensd@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210408095428.3983055-1-stevensd@google.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ce605cb0-ad27-e1b0-84c8-647ad1e19405@amd.com>
Date:   Thu, 8 Apr 2021 11:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210408095428.3983055-1-stevensd@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
X-ClientProxiedBy: AM3PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:207::17)
 To MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc] (2a02:908:1252:fb60:db83:c532:1fa2:b0cc) by AM3PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:207::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 09:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffc4cb2c-d2c6-4da1-2f9d-08d8fa7485ab
X-MS-TrafficTypeDiagnostic: BL0PR12MB2450:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2450E2DE51EA798EE870626E83749@BL0PR12MB2450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSRRx/1CYau9vIAopXczFKEj/vT32G2eRH3/qLrYa1hBKbk/snv+AJmyMROTotbN8NiVwq7o4WnElebxLk5eAUkAORJfYC6/NTz8wYgCniT9VoypHUtNV4VCPFgEcejvTNDutZfo3/r3t/laCzB8xvol2x4JEp1p0sj1Ey+hJ8pWwq/jN1YXERTRIfv4tBELBfqDLoaz/89j06olXhU79i7WO7tE8VHCEwHhM3HCTOMA/5tQZwbhWYzg6vVHn6wYsuHbi4FlirhVzi3XU6r8fMR8WHOE4ueOET0ozRRcI/WizcNe+hS4Z0rZbmdGyLK75M9XIxKiM9HSJPnUDgXUtm5mHWmYald41pEuy49/xr4VByaOPQDY6efBBwQFvIEA3o3q2AJm45M9rxbURwDrUDDTfay7UrpqsdGdltm+cNPsBDHndSjLAAlcc4TarGyMrUp1pKD+id5VZSSr3Msesaa3pTROsRCeXB3aUGsTnEewVyYIDUqr8KgGLSrV10iaYCOG1tY/v46JfsxafxGTKaWkGnVIjBquwp3u7UdnJXp7oXwmm3Su79eW863JrFEpAzCDuRMEhkud/BQuD2oaTCg3Y3EV7pS2bbCRKK6vflxu7l+FGn1qjmKMl52IvCx1MCllElP2gmlWsfdGpgvx2EKmOtQyA48pWLJugH9KYlPkgzTk8vHD1gdBIL+HYXPg39/KfFaiFbmJfC1W1WSIFftXZ/zVTxDnHLpMMunlQmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(54906003)(36756003)(186003)(16526019)(6666004)(316002)(7416002)(4326008)(6916009)(52116002)(6486002)(478600001)(66946007)(86362001)(66476007)(66556008)(31696002)(66574015)(5660300002)(83380400001)(2906002)(31686004)(2616005)(8676002)(8936002)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVdiZW9jZDVMTGVBejBBbEJCYjNFa1J0bnkyY01rR2ExZXEvSnlQU0dUYXdm?=
 =?utf-8?B?ZURTNmFDVlFDNE5ucUFLbWg0VkRzd0xNR2trWlliUFdxdHZpVFZlNE1lSzBK?=
 =?utf-8?B?RTIzbnh2RWZ0elVzT3lCWFRub2pvaC9LUVd6YmVqWU1VaUdEbTRVSXptUGti?=
 =?utf-8?B?YXU3R3NRVDh4aVlHTUIxVXVJT3l4QWYvd3BTdjJWRGw5NHhxME03OVpuOXhm?=
 =?utf-8?B?KzBYMUFtNnMwbHFDSjR3RndnanFORW04OXVZT21rRFZMNTQ3aXNERWoyc2Yy?=
 =?utf-8?B?WnBGcTltWVNCNUtTK2lZMXZhN2M4b2p6Q3NMSmZuNTg4SUJBaVJwZy9RTElE?=
 =?utf-8?B?ckNVTlY1ZW40NlVNMUJFVFpkYVRxSDNMeTM0a0hCb0dZNUtBVERWeTdBT041?=
 =?utf-8?B?eTE2NVNiTVcrQjNCS1BOditUUVQwYUhrblFTUVoxODZ3aHpsMjZCaVVCSklZ?=
 =?utf-8?B?WGRtVjgvNld5K0F4a0VhaGlzVVZmRmJqMFhvMUhQWHJOSk05TklnTzB3YUZQ?=
 =?utf-8?B?eUhNdDk1cFBHWUYzTGJZcFR3WnBvRzh5NHBadDUvMmxtQjI4U1ozc0l4V1ll?=
 =?utf-8?B?NGcyZkF3MFhON3JiamtucVRjUktZbjA4NStVRnZkWDVDZFdlNGlRNWw2eTR1?=
 =?utf-8?B?bzFKY2FTUkUyakF6ZEFNWmdpZVVRSTArTWhVTFNFM3Z4NUxDemY5c3l1YmV5?=
 =?utf-8?B?NjFOamtYeDlWZ1EyM1FFVXJRWHBPSG5yNVlkUXlySE5Wa1FtOThTYXY3V0JV?=
 =?utf-8?B?dDA0UW43cUwyekNxV1VZYmNnTitkRCsraCs5a295akNJdGxtZ2UyZ1ZxWWxh?=
 =?utf-8?B?R1NBTVNwSFFocm1yRGx1cisva0JjaEd0bStBVGdvZkllSFg0ZlBpbWUyTHFs?=
 =?utf-8?B?RC85TUVMeXd1L01MdlVOUDRJWXdCNU1kUGsxTVVieUFOMnpzSFZ2RER6R05R?=
 =?utf-8?B?cmRlY2NBOHUvWVp4eVNZN2hHUGlDT0llb3RMa0EvV3pLaWxabjJuYWRmemY2?=
 =?utf-8?B?dUFmVHVZblptOWl2OVpBU0pFeHN1SHdSVGNWWlVvd3UyQnJ0V0xHTktQMUJ3?=
 =?utf-8?B?VnczVXRReFFkb3AzQnMvWVZ6MlFLQjdteTlubEkzam94TkxRc3ByZGFTT2Iw?=
 =?utf-8?B?N09oN1BNNWkxbzYvVFFxcEhRczVDRUtSQjZJNnN4cCtvWWt4aENwbjdzMjl6?=
 =?utf-8?B?cms0TXo2Ymd6WmF2cTRPcld2QlRQT2JNdFM1L2lhRGxWWHlUTDJxdnNuQkRU?=
 =?utf-8?B?WGV5amsxMi9sb2MvcWY3clRBZEFpNHBZVHNQeWZhMGlGb2s1akNVMTh3b2hY?=
 =?utf-8?B?ZWNSMmJJd0lxZEliMElzOTd0WlhlcS9OaVpiN0FMaHlieFI4TUE1T3RtY01M?=
 =?utf-8?B?Tk5ZRTdIa2ZaV1p3d3dTTzVEMGJ5MzVvMjNFaEVzb1ZudWlHV2JkbGc5ZlFy?=
 =?utf-8?B?ejF0Y2NEUDBDb3NaNU8zWWQxcnBiVmwyNXRLTVlFREgvM016THZwdHNYR2p0?=
 =?utf-8?B?NnJwNWd3d3FJNlJZM1hvNXJTeWpHWnpSNHA4MmsyWS9PVXEzaFJJejlNb21M?=
 =?utf-8?B?VUl3VmloUWM5RlljMmJTbXdhTm9XNTJuWTR0N2VBdTlJNnlINUUreU5LWm1R?=
 =?utf-8?B?S1FVVzViblJqVzRrY0NJY3BoWTRLMlNnL0MvZFdJSU00SmQzRmRqWlU0NENC?=
 =?utf-8?B?UjBPYVFBREpYTlZpYVlDalo2Y0RZSHdESFVZdW5VVkpFY29xem5lRVdEZTIv?=
 =?utf-8?B?Q2ZCKzE2M1lKc1JaN05QZTNkSnQzMW8yVXQ4YzhrUXQrMWFRT3ovczBaZ0Nu?=
 =?utf-8?B?NlJZbDVGWEsxd3pscm9kYzFwZFJjTXZ6b3hXdEpVUkZ6TGxLaGE3a3dGMERI?=
 =?utf-8?Q?SeqZsLCUrsyjN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc4cb2c-d2c6-4da1-2f9d-08d8fa7485ab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:56:04.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M/cv0zWwkTSlag5nWtQkJuWl5xqyTHgwXeGDMBsXLqA/WifwaJoiCDf4R/uXHP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.04.21 um 11:54 schrieb David Stevens:
> From: David Stevens <stevensd@chromium.org>
>
> Allocate a new private stub fence in drm_syncobj_assign_null_handle,
> instead of using a static stub fence.
>
> When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
> userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
> obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
> should match when the fence's status was changed from the perspective of
> userspace, which is during the respective ioctl.
>
> When a static stub fence started being used in by these ioctls, this
> behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
> became the first time anything used the static stub fence, which has no
> meaning to userspace.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push this to drm-misc-next or how do you want to upstream it?

Thanks,
Christian.

> ---
> v2 -> v3:
>   - reuse the static stub spinlock
> v1 -> v2:
>   - checkpatch style fixes
>
>   drivers/dma-buf/dma-fence.c   | 27 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/drm_syncobj.c | 25 +++++++++++++++++++------
>   include/linux/dma-fence.h     |  1 +
>   3 files changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index d64fc03929be..ce0f5eff575d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -123,7 +123,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   /**
>    * dma_fence_get_stub - return a signaled fence
>    *
> - * Return a stub fence which is already signaled.
> + * Return a stub fence which is already signaled. The fence's
> + * timestamp corresponds to the first time after boot this
> + * function is called.
>    */
>   struct dma_fence *dma_fence_get_stub(void)
>   {
> @@ -141,6 +143,29 @@ struct dma_fence *dma_fence_get_stub(void)
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);
>   
> +/**
> + * dma_fence_allocate_private_stub - return a private, signaled fence
> + *
> + * Return a newly allocated and signaled stub fence.
> + */
> +struct dma_fence *dma_fence_allocate_private_stub(void)
> +{
> +	struct dma_fence *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (fence == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dma_fence_init(fence,
> +		       &dma_fence_stub_ops,
> +		       &dma_fence_stub_lock,
> +		       0, 0);
> +	dma_fence_signal(fence);
> +
> +	return fence;
> +}
> +EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> +
>   /**
>    * dma_fence_context_alloc - allocate an array of fence contexts
>    * @num: amount of contexts to allocate
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 349146049849..a54aa850d143 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -350,12 +350,16 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>    *
>    * Assign a already signaled stub fence to the sync object.
>    */
> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>   {
> -	struct dma_fence *fence = dma_fence_get_stub();
> +	struct dma_fence *fence = dma_fence_allocate_private_stub();
> +
> +	if (IS_ERR(fence))
> +		return PTR_ERR(fence);
>   
>   	drm_syncobj_replace_fence(syncobj, fence);
>   	dma_fence_put(fence);
> +	return 0;
>   }
>   
>   /* 5s default for wait submission */
> @@ -469,6 +473,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>   int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   		       struct dma_fence *fence)
>   {
> +	int ret;
>   	struct drm_syncobj *syncobj;
>   
>   	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> @@ -479,8 +484,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   	INIT_LIST_HEAD(&syncobj->cb_list);
>   	spin_lock_init(&syncobj->lock);
>   
> -	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
> -		drm_syncobj_assign_null_handle(syncobj);
> +	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> +		ret = drm_syncobj_assign_null_handle(syncobj);
> +		if (ret < 0) {
> +			drm_syncobj_put(syncobj);
> +			return ret;
> +		}
> +	}
>   
>   	if (fence)
>   		drm_syncobj_replace_fence(syncobj, fence);
> @@ -1322,8 +1332,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> -	for (i = 0; i < args->count_handles; i++)
> -		drm_syncobj_assign_null_handle(syncobjs[i]);
> +	for (i = 0; i < args->count_handles; i++) {
> +		ret = drm_syncobj_assign_null_handle(syncobjs[i]);
> +		if (ret < 0)
> +			break;
> +	}
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9f12efaaa93a..6ffb4b2c6371 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   }
>   
>   struct dma_fence *dma_fence_get_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   
>   #define DMA_FENCE_TRACE(f, fmt, args...) \

