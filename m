Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F6A28F43C
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 16:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgJOOBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 10:01:02 -0400
Received: from mail-dm6nam08on2059.outbound.protection.outlook.com ([40.107.102.59]:2912
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730385AbgJOOBB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 10:01:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIEdIhAerksJz7LFA0/2tMVoP1eYy2m2Ya1PNPh5OrBDlo8nj2XEoSxbXWxo4Mz4DolOmzMtA+KEn8NPqB3wSk9m0s6LI/lDt/nJZ9hnUN1NTFw4XWEZa2dFSf9EimZAzUy4pn80DinZrRTZX4USS51MIogLo6gfidx5GriksHEWABTdpSuaHvrZpvThRPVgxiFnvjsGJ3PHFlgNcXfAtpZm/L8qGUaBN41c1wIdCb7/Ae6z4yntsDE9uVAK/FuqGrUhYQmzhO4SyJuZ4YfE747oNTNqVm7I7KSi/SioaWn8VRY/j3oqSSeUcKT+0yGuLT7jwmxpUBlYLCCfKvhhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyDMUj3c5Q/kAKqLamJTbfJcmn3zhWOYAX0CC7GZMQ8=;
 b=QTNqZ9bvtZskR6e39cbFMEBGtNy7Gf+S6js8Ub00HbZEp+CGzn2K162OqBmSWT8ES5GJ7/kzJQJPLlLK1j8+u/UGGHOBZTLmSHlyqgg9ab3Il9iXLyehrlLzJUepHURVQIUqsOTAADU8wVy1o7OWjazoxzMRRp+3DxADPI5Gd/9w1vdGMaxEtyMDH9cF0P0e9+DxWgeeDMBABuSGo9BJwCsIn1Gv8EO86RdopZzGKtyLe6df0sx3LnpTVFr7Tfc3hdKOF/S4UnbFmvXSXc5niVn/UlLb2DnpFFaPIy1+EzN6mIfQrZBOBHJynyVzYVZGSyvE5yVcpD0LjkwcAGNy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyDMUj3c5Q/kAKqLamJTbfJcmn3zhWOYAX0CC7GZMQ8=;
 b=nOxo+crch41rHvdBum9AtQW7CBZ126KH3aDpN2sdW8FdpdjZbswJpvxloNTgfl1wbbtTMqly2HlxcVx4TvM6PlGXkzFSfFVWW9yGEdv0x9BPzobGw3xK0pMx4gILw82yOirM5xL9KTkjHX/CPtKbLkvdQgS8nhnLq3vxj2lQpBk=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 14:00:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 14:00:57 +0000
Subject: Re: [PATCH v4 04/10] drm/exynos: Remove empty
 exynos_drm_gem_prime_{vmap,vunmap}()
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, kraxel@redhat.com,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
        heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-5-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7a6f6526-1b67-61c8-2239-50f2bfbdc29d@amd.com>
Date:   Thu, 15 Oct 2020 16:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by AM0PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:208:d2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Thu, 15 Oct 2020 14:00:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc82f225-0f8a-43ae-cb58-08d87112bccd
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4690BB9C565CA20B6B0332C883020@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JBOwexIirDjBJSp39MdGx4etjX+D1JSxS0P8TKGjAx1Bmi1T/HpRGzkBUKpTm/XTd+/LrRMDocaj0Ux25QJ6ln93vwns8Cz82KXZp7az7wmFCwWDpKO5vCP3wdZhpKpdPGUQqsKTDxaSn4+A1aVXQOp4XRT0QJbqMPxQi8X7LBscjIL6rbKrxyCaaXEiW3RU34nFc6HjddNFg2AT4/Bh8f0C3aGvk/tUDErgOCm/9tDgXNzjn9lVfTaLEsbwx1LnZADAqpstprcTTr3gIx0vfW6ojRELLMSUc9DWwsuGmk5tjPuih28IqGJm18Oh6fI8Pm17X9yq8xQQYf0gRbte3FCMU0f4zIQiP/BB9JGvacfcxiCYo5ytMK9w9TN1SfHsjr9k38s3MzdcvZ1rClA8wEbsJP6VUXTqHQt7W/Qon9GVQQ+FvBVIvKlzQuqmAMf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(956004)(478600001)(31686004)(8676002)(7416002)(4326008)(8936002)(7406005)(52116002)(186003)(2906002)(16526019)(26005)(6486002)(34490700002)(31696002)(83380400001)(16576012)(2616005)(86362001)(6666004)(316002)(66946007)(66556008)(5660300002)(66476007)(36756003)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: L+lw87r0GARxt6cpx/CQ9Knf+dyyeSpa0SnuyLreuQ4Ft54/jY4lbP8rZ5fgVHeZXyxczESkVI0XZU6KBk94qGVEzWZZ5+57Kb77FSr1MnmNvk5plVOe07W0Ju2YnE7dyIT4jMLY5Jaqw1CqI5/d7vfCVjJEriMzHd1ALMy2hXA8wH40hv9U/S/RE7aIjNjSl3FlWorHI/NaKLuCh3VBY5dDrHnxySi4nl6kVkttFn1vl6/Ralb3uGiSNjawA+PQzTCjlxFz5bP2njR4gEsbIBaF4gXPYLh6Tz4LxOhfHFmLj38gWfj7HZdcdMfLfSy/ukOkLME1tQ2gRj3cKz9E9DiMUsGPbP5GaCZzjGzYrCElmJbtLn8ZlrVcx3hrAFHV6g1ZKTCikLz3QTDjKJcV68T4rvyQYR9taf5IJQkqDSbLCTPjFD3+vU6GAAta3DPSJQXGaGUchlpve77w02No8FlfZIYKGJ7n99pRq1GLG0ir7UPHltbBjl3bysAZAQxszNBUZ7+bcXMEj9fa23yQ3FXp4ec8tT6tMVLazB8Djb2GLFu4mBgMuXx83KOgE3CtDf3tvNRHKx4kCrZMtIbBF7NXZigE7/BDE8xK86q78Owkpk4BOQelhulmZKJ1hIPekqr/gm5sTJXpG8JiW5Djxw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc82f225-0f8a-43ae-cb58-08d87112bccd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:00:57.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NidAfpRa2NMLEGdnFWdYvsER8j3pbm+Oaf1NwO8cr9OAacK7WMR3KCrCNNQSGLqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> The functions exynos_drm_gem_prime_{vmap,vunmap}() are empty. Remove
> them before changing the interface to use struct drm_buf_map. As a side
> effect of removing drm_gem_prime_vmap(), the error code changes from
> ENOMEM to EOPNOTSUPP.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 12 ------------
>   drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
>   2 files changed, 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index e7a6eb96f692..13a35623ac04 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -137,8 +137,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
>   static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
>   	.free = exynos_drm_gem_free_object,
>   	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> -	.vmap = exynos_drm_gem_prime_vmap,
> -	.vunmap	= exynos_drm_gem_prime_vunmap,
>   	.vm_ops = &exynos_drm_gem_vm_ops,
>   };
>   
> @@ -471,16 +469,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>   	return &exynos_gem->base;
>   }
>   
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
> -{
> -	return NULL;
> -}
> -
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> -{
> -	/* Nothing to do */
> -}
> -
>   int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>   			      struct vm_area_struct *vma)
>   {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 74e926abeff0..a23272fb96fb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -107,8 +107,6 @@ struct drm_gem_object *
>   exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>   				     struct dma_buf_attachment *attach,
>   				     struct sg_table *sgt);
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj);
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>   			      struct vm_area_struct *vma);
>   

