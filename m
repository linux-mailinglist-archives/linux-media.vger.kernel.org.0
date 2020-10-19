Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D202924CD
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 11:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgJSJpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 05:45:23 -0400
Received: from mail-bn7nam10on2063.outbound.protection.outlook.com ([40.107.92.63]:10848
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727254AbgJSJpX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 05:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/FnliMyyc6PzCm4aGI3rSXrefs5zb8xHdj9d4DoBgWJGSx5tqXDWQNbDsrfwSW64QJXT3XpiEmjQaKx2vI6Nrlwn4sBuq4DsmOg04T61+sn1kk0kLOyVz0WvIGI3psXcXI5nMG9G/Dmg0mR9/R6ERPeYsQo9othw9gpZVI1f2e5k0rhFU6N8yTPH9M1vdOwQKkg432WGS1wQHe/dvgYzS1Ub0lWneymsjUi/oOeusurrTiBxRIoLvzf+pbbgAk8C7j9yE6ik3AO2tqfQ3f/hkJZfkAwvT2+LMf3N2enasi0bLT8oMM/Q93CNjzMu7TxcNvF6CrwSH9SI1C9u81htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy5wcv5D2MUJuqKGL0V1ByCyOy9bh9LcggVVNvf/G48=;
 b=XOY4lcQe5HP+yb73hEvle0YLe/CjrfoogLOfcozRJe/tyx2S5zM/lUvq7PE0orshiVfvL+5cQXSTgtFn7LaNy18omq9h3JFx2orDxBnQYk+O5xez1N7aCShbv2a/R2q7RL42rofSB0odkrwjFhHU/m3A1nB7AMfFl9+XvBG8pJBhiYHUsYmASfs1YZB/u/90LS8FOpOJQ1HRAc/k0l66NKSrV/9dEBKbBMh8wgysDXUaZFkSRQzqZxah8MMbnM/zTvIQ8yI17/qmyKHrsDujb3G9pGAKYDBdr5Col73Qt6iqlHzpIm1KqTFIB4tCKTJDt4+qTxzJ6YRc/FqgtlGRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy5wcv5D2MUJuqKGL0V1ByCyOy9bh9LcggVVNvf/G48=;
 b=HAisxrqOxM+yFzBIeivQca5MQl1W0EvQh9xsuS0W2b87Rt1SPj5cCrl7+Oi4yjd2jCISBR4uXY/rDuYAs9kGwzzAz7O+AYk9MEcNArQG26gfIl5eJieuGbvjQCOBJge35t749Mpuih+3wZ7PTUAejRJiSusdxGVeUQynWh6tM2w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 09:45:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:45:17 +0000
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
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
Cc:     linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
        spice-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
 <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
 <87c7c342-88dc-9a36-31f7-dae6edd34626@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9236f51c-c1fa-dadc-c7cc-d9d0c09251d1@amd.com>
Date:   Mon, 19 Oct 2020 11:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87c7c342-88dc-9a36-31f7-dae6edd34626@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:208:ac::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.9 via Frontend Transport; Mon, 19 Oct 2020 09:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2de45ee1-d684-4c5f-c143-08d87413af3e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417E35B821E9EF7A5B5AFC6831E0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4JLIMQwIVNzm92UzbJlG+1uGqD85bpaIBIWdkIvqy+5bO5umDecUzbdA2OrHnWTG50cA0ny/JCI1CzZvgyw+1FjN6aHmgVWrigZavYKj4LEcL+cX1UuDfTRfkC8NzdRfzBHjF3yyBdvUo89iJHR7FZMTD0ZlbISd1mPI8Fa5XZpx5SjPmGla1TR5B2rOimNL5gyzLsN/REXOw2vHcHZUuVpHzPapMDpBgw2stBq2jE5cJ9/1g7aIAe24EC6dbmiq0izN119FshZyW9GSTbyY1M+N358gLMv2N13z9bTckIsQ6IA2m5YRbmaev473/bBwUziHD1Gy88gW5JCfltSlE8k1Ia+qPkLFXHGxMrJEs2EZPqnwwDTOjA9VU2UXcpnNRzvMQpqXhcSS3p7NG2ZxaXmUKVj/X/7GDfIarrkPcDn2jqmmV2rzfthVFUk+jt7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(83380400001)(45080400002)(966005)(8676002)(4326008)(31686004)(6666004)(2906002)(186003)(16526019)(36756003)(86362001)(2616005)(478600001)(5660300002)(8936002)(66556008)(66476007)(316002)(66946007)(31696002)(7416002)(7406005)(6486002)(52116002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: DG1IF2aGtntU1HnH8WrGQv0BxrOWgvoFrUvrZ/ETE+qVydH2YByWQoPMDbLtl9PnDVbVhG0frqeMFhQaf3Vtz58lN+BSVBxX/5YUoCuHfVPbHNJ131OF8BG8o6HCx7qfKAWQKi23SjRRvPudmHmWydDaVWdoqlx94dmGGZApy3JBO+X666gv4eq6P1Ayr5gK8mtM4FY0/7ymmY5CLucrj9cD580hMoYunzbjo0HfzPktCM7UcpiT2vhkO+wSXS0SsmI0azvvvWDuBLVpGNm8+l0yiOtuU/dxHEaCNGB3WkK/An6zQrQqh008D0JHt84NNz4bvORAypo23Przrlyso7NFrkuYqC9jaOoFFmI3+T8agjgKPHWUTQ51akC/pRhom8yKrGoOBEnG71Q2UNIplHahwdmMVp/1LRC+khx1EM2TjUWmhOAwm7lgtIJWF0PKBJWS30Vl8X9LENEebXdouzN6nWe3nCnGVUHadIrKdTpq+NbSUTcx+UbOMyZhTs168y9mbcqx+R3rdsxnkJoDT0bF4CJpPCD3DDcTXrxX0amQ/6h4CMtW3V0114sgtEqNNrvMiHRmJH1dN12YFa/MB+4p0JrR+eBXjMZhu9PyaWZpVjCop9rk71seQY2VElj+z0N0U4v+eAESUsMqU9kJs9fohrQ1+WkOCQxetK3hLiK1hTG+R/85SbfwKIcuX7ABSxg5EviUsj6gJOIbQiqtkg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de45ee1-d684-4c5f-c143-08d87413af3e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:45:17.7275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufX6vJ7VDtZTX3Z4vj04OPUaH+aqZVdTPZh+3zWPb5h0W+0bW29R9aWCT+GnVwx0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

[SNIP]
>>>    +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
>>> +{
>>> +    struct ttm_resource *mem = &bo->mem;
>>> +    int ret;
>>> +
>>> +    ret = ttm_mem_io_reserve(bo->bdev, mem);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (mem->bus.is_iomem) {
>>> +        void __iomem *vaddr_iomem;
>>> +        unsigned long size = bo->num_pages << PAGE_SHIFT;
>> Please use uint64_t here and make sure to cast bo->num_pages before
>> shifting.
> I thought the rule of thumb is to use u64 in source code. Yet TTM only
> uses uint*_t types. Is there anything special about TTM?

My last status is that you can use both and my personal preference is to 
use the uint*_t types because they are part of a higher level standard.

>> We have an unit tests of allocating a 8GB BO and that should work on a
>> 32bit machine as well :)
>>
>>> +
>>> +        if (mem->bus.addr)
>>> +            vaddr_iomem = (void *)(((u8 *)mem->bus.addr));
> I after reading the patch again, I realized that this is the
> 'ttm_bo_map_premapped' case and it's missing from _vunmap(). I see two
> options here: ignore this case in _vunmap(), or do an ioremap()
> unconditionally. Which one is preferable?

ioremap would be very very bad, so we should just do nothing.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>> +        else if (mem->placement & TTM_PL_FLAG_WC)
>> I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new
>> mem->bus.caching enum as replacement.
>>
>>> +            vaddr_iomem = ioremap_wc(mem->bus.offset, size);
>>> +        else
>>> +            vaddr_iomem = ioremap(mem->bus.offset, size);
>>> +
>>> +        if (!vaddr_iomem)
>>> +            return -ENOMEM;
>>> +
>>> +        dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
>>> +
>>> +    } else {
>>> +        struct ttm_operation_ctx ctx = {
>>> +            .interruptible = false,
>>> +            .no_wait_gpu = false
>>> +        };
>>> +        struct ttm_tt *ttm = bo->ttm;
>>> +        pgprot_t prot;
>>> +        void *vaddr;
>>> +
>>> +        BUG_ON(!ttm);
>> I think we can drop this, populate will just crash badly anyway.
>>
>>> +
>>> +        ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        /*
>>> +         * We need to use vmap to get the desired page protection
>>> +         * or to make the buffer object look contiguous.
>>> +         */
>>> +        prot = ttm_io_prot(mem->placement, PAGE_KERNEL);
>> The calling convention has changed on drm-misc-next as well, but should
>> be trivial to adapt.
>>
>> Regards,
>> Christian.
>>
>>> +        vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
>>> +        if (!vaddr)
>>> +            return -ENOMEM;
>>> +
>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_vmap);
>>> +
>>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
>>> *map)
>>> +{
>>> +    if (dma_buf_map_is_null(map))
>>> +        return;
>>> +
>>> +    if (map->is_iomem)
>>> +        iounmap(map->vaddr_iomem);
>>> +    else
>>> +        vunmap(map->vaddr);
>>> +    dma_buf_map_clear(map);
>>> +
>>> +    ttm_mem_io_free(bo->bdev, &bo->mem);
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_vunmap);
>>> +
>>>    static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
>>>                     bool dst_use_tt)
>>>    {
>>> diff --git a/include/drm/drm_gem_ttm_helper.h
>>> b/include/drm/drm_gem_ttm_helper.h
>>> index 118cef76f84f..7c6d874910b8 100644
>>> --- a/include/drm/drm_gem_ttm_helper.h
>>> +++ b/include/drm/drm_gem_ttm_helper.h
>>> @@ -10,11 +10,17 @@
>>>    #include <drm/ttm/ttm_bo_api.h>
>>>    #include <drm/ttm/ttm_bo_driver.h>
>>>    +struct dma_buf_map;
>>> +
>>>    #define drm_gem_ttm_of_gem(gem_obj) \
>>>        container_of(gem_obj, struct ttm_buffer_object, base)
>>>      void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int
>>> indent,
>>>                    const struct drm_gem_object *gem);
>>> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>> +             struct dma_buf_map *map);
>>> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>>> +            struct dma_buf_map *map);
>>>    int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>>                 struct vm_area_struct *vma);
>>>    diff --git a/include/drm/ttm/ttm_bo_api.h
>>> b/include/drm/ttm/ttm_bo_api.h
>>> index 37102e45e496..2c59a785374c 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -48,6 +48,8 @@ struct ttm_bo_global;
>>>      struct ttm_bo_device;
>>>    +struct dma_buf_map;
>>> +
>>>    struct drm_mm_node;
>>>      struct ttm_placement;
>>> @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>>> unsigned long start_page,
>>>     */
>>>    void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>>>    +/**
>>> + * ttm_bo_vmap
>>> + *
>>> + * @bo: The buffer object.
>>> + * @map: pointer to a struct dma_buf_map representing the map.
>>> + *
>>> + * Sets up a kernel virtual mapping, using ioremap or vmap to the
>>> + * data in the buffer object. The parameter @map returns the virtual
>>> + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap().
>>> + *
>>> + * Returns
>>> + * -ENOMEM: Out of memory.
>>> + * -EINVAL: Invalid range.
>>> + */
>>> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
>>> +
>>> +/**
>>> + * ttm_bo_vunmap
>>> + *
>>> + * @bo: The buffer object.
>>> + * @map: Object describing the map to unmap.
>>> + *
>>> + * Unmaps a kernel map set up by ttm_bo_vmap().
>>> + */
>>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
>>> *map);
>>> +
>>>    /**
>>>     * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>>>     *
>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>> index fd1aba545fdf..2e8bbecb5091 100644
>>> --- a/include/linux/dma-buf-map.h
>>> +++ b/include/linux/dma-buf-map.h
>>> @@ -45,6 +45,12 @@
>>>     *
>>>     *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>     *
>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>> + *
>>> + * .. code-block:: c
>>> + *
>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>> + *
>>>     * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>     * dma_buf_map_is_null().
>>>     *
>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>> dma_buf_map *map, void *vaddr)
>>>        map->is_iomem = false;
>>>    }
>>>    +/**
>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>> an address in I/O memory
>>> + * @map:        The dma-buf mapping structure
>>> + * @vaddr_iomem:    An I/O-memory address
>>> + *
>>> + * Sets the address and the I/O-memory flag.
>>> + */
>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>> +                           void __iomem *vaddr_iomem)
>>> +{
>>> +    map->vaddr_iomem = vaddr_iomem;
>>> +    map->is_iomem = true;
>>> +}
>>> +
>>>    /**
>>>     * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>> for equality
>>>     * @lhs:    The dma-buf mapping structure
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C07bc68af3c6440b5be8d08d8740e9b32%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637386953433558595%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RlGCmjzyZERvqfnl4kA1bEHez5bkLf3F9OlKi2ybDAM%3D&amp;reserved=0

