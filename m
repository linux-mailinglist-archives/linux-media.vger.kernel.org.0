Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BE629021C
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 11:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406132AbgJPJlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 05:41:36 -0400
Received: from mail-dm6nam10on2054.outbound.protection.outlook.com ([40.107.93.54]:24576
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405757AbgJPJlf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 05:41:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts6/SrHzaw02eNPj7RW7eNnsHMF5DZyvK/z/G5BpLKWqnNi3T9HO96ji1g0OCXEVUilDj6SzeA+p8oJ8AJtSdkVfwpGFI7u3G8c7Rf6B6Lrjx7kDDEPx7J+BZBvaUxKlTMyGAzt34zr8D2UGgr+LWPvdoVR6rMu5ah/dmS9zOTWmtNpLQxnuPwd0ZRl/X4QkgVqIW72SWG2RoRvrIMia1+L4L9JOnoPloG5173KQFJ5fdZi9SmueSQAGkXe1bqbEMyjdmdBomHCLmnT2bjWWtqFCCh/9vFb5N/8OOo5R/4H8mWwQqRiC2PUCdWEkY+6x5SF/dBOAyjaRfJFtiakQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XMm/GtOB8CkNbU+RYyJp4wxnJVOunCEcz5wnrBr9Rg=;
 b=H3jSVXJB4QFPOOs4cg+HqU/QoWUTZJIlhyU1sza4MCL9yMPnpO5QFPd5Y+3HEgLM/D6kIXLrAcW1p+/7drzH6+zwBEPe4v57y1yRX7l97afPq4EaqLZ5USj1CwnUJmp2ZJtyHkMpWDJJW1RSYKx6E3PqfPkqEIXHYqICBp5NEbGAK4HvRO5KIDN5k+ZBbvuZh2HaTwC9F/o6VV1883KrVZMVtGg9DCDTYDecpYbOXHQ/JJGzQNJRVRzBO65Tf4ojKys/MmSshTP6q2pJLscxllvGvIs67ojDEz1zwKRab+31Bm2VuIKDh7O/Ar9fQLMWm0ueaCReekGtYntIUZ4LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XMm/GtOB8CkNbU+RYyJp4wxnJVOunCEcz5wnrBr9Rg=;
 b=GM0LmMBc9yArv1T3fvM1NOAE1YmmENohhCciWH/aI3WjBG4lEYHGuO0cWskiEs+8NT9mUSD7oifyS1Ek45SP4VPxkNX2YogTyFtpszGuZHRyBZd4d45aH+HzwmrqW6tr/LKwWYQ5GSOu5L0321qLqVYg9farI5ngPGKfO/YqhW0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 09:41:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 09:41:29 +0000
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, kyungmin.park@samsung.com,
        miaoqinglang@huawei.com, yuq825@gmail.com,
        alexander.deucher@amd.com, linux-media@vger.kernel.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
 <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
 <20201015164909.GC401619@phenom.ffwll.local>
 <20201015195204.1745fe7f@linux-uq9g>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <64130e2a-0e45-60da-2929-6378f59bfe97@amd.com>
Date:   Fri, 16 Oct 2020 11:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015195204.1745fe7f@linux-uq9g>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0PR03CA0033.eurprd03.prod.outlook.com
 (2603:10a6:208:14::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by AM0PR03CA0033.eurprd03.prod.outlook.com (2603:10a6:208:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 09:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54e4b907-3e0e-4ef0-1473-08d871b7a82f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB383767E6EC0D7063954B084F83030@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXrTBd+9u88VHMYd93epeIhDctfIidsN0+eRMwgJeZ4f7vbmChJRtXSPE0tzniBYcfbyYVioTrHbJVxAYhU73cGY9/GSqypKXAYfBo2OHVFYT75GsuwS6VsduvNfgBCpIevzjIpNALsmASBClljY9Ui+M2vejOZ6EAo10dir3OhMcyh6YxoNtOaPQ59jp5/nUtEqAeJ3SIVKHD1kPjRYwA4b+ufFF42k6v8mt1ova7xaZaEpA7Hkix7ndenrqioHD4Wh9/zESOv15DH5d8eGws5/0aiOdMu7pXwTTldFbOzpoDjCDN6Q/yW4Mu3fFAeWOr9TdSyRLnFHM25WcMnl350Zl47ormcdrerbqyga/PCd4Il+/iBqs26dlC/tbUVcCQS9mpVbmz1LD7bipc87WAy9TIyjs0e72bTf4OgkuY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(26005)(4326008)(36756003)(34490700002)(66574015)(66476007)(66556008)(8936002)(66946007)(478600001)(186003)(16526019)(6486002)(83380400001)(316002)(2906002)(31686004)(52116002)(8676002)(2616005)(956004)(5660300002)(86362001)(30864003)(110136005)(6666004)(7406005)(7416002)(16576012)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kd8mF2L8WHHygvAkT90vDROU8vQq0A0ughG3wUf/bkLVVaF0EFqxgCtw3OePigZuV0QXlFEdkyklsa0aM6ih4f2E3Kwf9pvY2VdXYFLF1a8b2l/ZA36ocJHpj5xh6RCvqzDBLN3BB/65yobSvT7hOpFzmgYLh4eynADy2jy/diab1fe5PYWcGHXxn+mbn8HYpfukCUJxl8fzdWkZJhXWKKOF0eQ+AGlb236N/CA0WwV2e4ZuFgTkp/ic1JOuVF5Q/gTNdB8f3nAY9Ob5MzUAYTMhugIpihSoyK8uuzbPWH/5W33cas1LjiR/p/joDFedIutYL7oAHF8CHsUxlQ1wN2CXJ0/0AwhwBZw0u214ip6+OotCSGXr+K/hfIMOXrnSlpDSPr0yabhrpAv5XUFQ+9DUzd3bbAJg1rqlRHYZ4H9jdcmtPKNuzq0mJ0WHfvfV5zCu9JMWKq7WRgJsxAe1WxfNsZY6YshZZiovmUWWwdxZsw4jIsXlvzkmQbBxZnOmvzimRR+9q1uikrVzfC5Kb5FLbO837eOUXfDH3D/LGRh3b6iOKYfDp0tpiXoKdoZmfTtzOKoMPWe70DyUY4VcRU7CTn+odv5Z3hlK4iBOrfvYDiE3mH/1LT15nTK7qAkuP2dykTBqcPjrxxtKzsaNrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e4b907-3e0e-4ef0-1473-08d871b7a82f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 09:41:29.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVU1kujjrTYOiK+xPO0JkP7qNIMXM5FC6bkmq3N1xjwvDaTuFxAbX7NPKjPDi0GL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.10.20 um 19:52 schrieb Thomas Zimmermann:
> Hi
>
> On Thu, 15 Oct 2020 18:49:09 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
>> On Thu, Oct 15, 2020 at 04:08:13PM +0200, Christian König wrote:
>>> Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
>>>> The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in
>>>> kernel address space. The mapping's address is returned as struct
>>>> dma_buf_map. Each function is a simplified version of TTM's existing
>>>> kmap code. Both functions respect the memory's location ani/or
>>>> writecombine flags.
>>>>
>>>> On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
>>>> two helpers that convert a GEM object into the TTM BO and forward the
>>>> call to TTM's vmap/vunmap. These helpers can be dropped into the rsp
>>>> GEM object callbacks.
>>>>
>>>> v4:
>>>> 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers
>>>> (Daniel, Christian)
>>> Bunch of minor comments below, but over all look very solid to me.
>> Yeah I think just duplicating the ttm bo map stuff for vmap is indeed the
>> cleanest. And then we can maybe push the combinatorial monster into
>> vmwgfx, which I think is the only user after this series. Or perhaps a
>> dedicated set of helpers to map an invidual page (again using the
>> dma_buf_map stuff).
>  From a quick look, I'd say it should be possible to have the same interface
> for kmap/kunmap as for vmap/vunmap (i.e., parameters are bo and dma-buf-map).
> All mapping state can be deduced from this. And struct ttm_bo_kmap_obj can be
> killed off entirely.

Yes, that would be rather nice to have.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>> I'll let Christian with the details, but at a high level this is
>> definitely
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Thanks a lot for doing all this.
>> -Daniel
>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
>>>>    include/drm/drm_gem_ttm_helper.h     |  6 +++
>>>>    include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
>>>>    include/linux/dma-buf-map.h          | 20 ++++++++
>>>>    5 files changed, 164 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> b/drivers/gpu/drm/drm_gem_ttm_helper.c index 0e4fb9ba43ad..db4c14d78a30
>>>> 100644 --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p,
>>>> unsigned int indent, }
>>>>    EXPORT_SYMBOL(drm_gem_ttm_print_info);
>>>> +/**
>>>> + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
>>>> + * @gem: GEM object.
>>>> + * @map: [out] returns the dma-buf mapping.
>>>> + *
>>>> + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
>>>> + * &drm_gem_object_funcs.vmap callback.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success, or a negative errno code otherwise.
>>>> + */
>>>> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>>> +		     struct dma_buf_map *map)
>>>> +{
>>>> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>>> +
>>>> +	return ttm_bo_vmap(bo, map);
>>>> +
>>>> +}
>>>> +EXPORT_SYMBOL(drm_gem_ttm_vmap);
>>>> +
>>>> +/**
>>>> + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
>>>> + * @gem: GEM object.
>>>> + * @map: dma-buf mapping.
>>>> + *
>>>> + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used
>>>> as
>>>> + * &drm_gem_object_funcs.vmap callback.
>>>> + */
>>>> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>>>> +			struct dma_buf_map *map)
>>>> +{
>>>> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>>> +
>>>> +	ttm_bo_vunmap(bo, map);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
>>>> +
>>>>    /**
>>>>     * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
>>>>     * @gem: GEM object.
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c index bdee4df1f3f2..80c42c774c7d
>>>> 100644 --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -32,6 +32,7 @@
>>>>    #include <drm/ttm/ttm_bo_driver.h>
>>>>    #include <drm/ttm/ttm_placement.h>
>>>>    #include <drm/drm_vma_manager.h>
>>>> +#include <linux/dma-buf-map.h>
>>>>    #include <linux/io.h>
>>>>    #include <linux/highmem.h>
>>>>    #include <linux/wait.h>
>>>> @@ -526,6 +527,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_bo_kunmap);
>>>> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
>>>> +{
>>>> +	struct ttm_resource *mem = &bo->mem;
>>>> +	int ret;
>>>> +
>>>> +	ret = ttm_mem_io_reserve(bo->bdev, mem);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (mem->bus.is_iomem) {
>>>> +		void __iomem *vaddr_iomem;
>>>> +		unsigned long size = bo->num_pages << PAGE_SHIFT;
>>> Please use uint64_t here and make sure to cast bo->num_pages before
>>> shifting.
>>>
>>> We have an unit tests of allocating a 8GB BO and that should work on a
>>> 32bit machine as well :)
>>>
>>>> +
>>>> +		if (mem->bus.addr)
>>>> +			vaddr_iomem = (void *)(((u8 *)mem->bus.addr));
>>>> +		else if (mem->placement & TTM_PL_FLAG_WC)
>>> I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new
>>> mem->bus.caching enum as replacement.
>>>
>>>> +			vaddr_iomem = ioremap_wc(mem->bus.offset,
>>>> size);
>>>> +		else
>>>> +			vaddr_iomem = ioremap(mem->bus.offset, size);
>>>> +
>>>> +		if (!vaddr_iomem)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
>>>> +
>>>> +	} else {
>>>> +		struct ttm_operation_ctx ctx = {
>>>> +			.interruptible = false,
>>>> +			.no_wait_gpu = false
>>>> +		};
>>>> +		struct ttm_tt *ttm = bo->ttm;
>>>> +		pgprot_t prot;
>>>> +		void *vaddr;
>>>> +
>>>> +		BUG_ON(!ttm);
>>> I think we can drop this, populate will just crash badly anyway.
>>>
>>>> +
>>>> +		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		/*
>>>> +		 * We need to use vmap to get the desired page
>>>> protection
>>>> +		 * or to make the buffer object look contiguous.
>>>> +		 */
>>>> +		prot = ttm_io_prot(mem->placement, PAGE_KERNEL);
>>> The calling convention has changed on drm-misc-next as well, but should be
>>> trivial to adapt.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +		vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
>>>> +		if (!vaddr)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		dma_buf_map_set_vaddr(map, vaddr);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_bo_vmap);
>>>> +
>>>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
>>>> *map) +{
>>>> +	if (dma_buf_map_is_null(map))
>>>> +		return;
>>>> +
>>>> +	if (map->is_iomem)
>>>> +		iounmap(map->vaddr_iomem);
>>>> +	else
>>>> +		vunmap(map->vaddr);
>>>> +	dma_buf_map_clear(map);
>>>> +
>>>> +	ttm_mem_io_free(bo->bdev, &bo->mem);
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_bo_vunmap);
>>>> +
>>>>    static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
>>>>    				 bool dst_use_tt)
>>>>    {
>>>> diff --git a/include/drm/drm_gem_ttm_helper.h
>>>> b/include/drm/drm_gem_ttm_helper.h index 118cef76f84f..7c6d874910b8
>>>> 100644 --- a/include/drm/drm_gem_ttm_helper.h
>>>> +++ b/include/drm/drm_gem_ttm_helper.h
>>>> @@ -10,11 +10,17 @@
>>>>    #include <drm/ttm/ttm_bo_api.h>
>>>>    #include <drm/ttm/ttm_bo_driver.h>
>>>> +struct dma_buf_map;
>>>> +
>>>>    #define drm_gem_ttm_of_gem(gem_obj) \
>>>>    	container_of(gem_obj, struct ttm_buffer_object, base)
>>>>    void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int
>>>> indent, const struct drm_gem_object *gem);
>>>> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>>> +		     struct dma_buf_map *map);
>>>> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>>>> +			struct dma_buf_map *map);
>>>>    int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>>>    		     struct vm_area_struct *vma);
>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>> index 37102e45e496..2c59a785374c 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -48,6 +48,8 @@ struct ttm_bo_global;
>>>>    struct ttm_bo_device;
>>>> +struct dma_buf_map;
>>>> +
>>>>    struct drm_mm_node;
>>>>    struct ttm_placement;
>>>> @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>>>> unsigned long start_page, */
>>>>    void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>>>> +/**
>>>> + * ttm_bo_vmap
>>>> + *
>>>> + * @bo: The buffer object.
>>>> + * @map: pointer to a struct dma_buf_map representing the map.
>>>> + *
>>>> + * Sets up a kernel virtual mapping, using ioremap or vmap to the
>>>> + * data in the buffer object. The parameter @map returns the virtual
>>>> + * address as struct dma_buf_map. Unmap the buffer with
>>>> ttm_bo_vunmap().
>>>> + *
>>>> + * Returns
>>>> + * -ENOMEM: Out of memory.
>>>> + * -EINVAL: Invalid range.
>>>> + */
>>>> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
>>>> +
>>>> +/**
>>>> + * ttm_bo_vunmap
>>>> + *
>>>> + * @bo: The buffer object.
>>>> + * @map: Object describing the map to unmap.
>>>> + *
>>>> + * Unmaps a kernel map set up by ttm_bo_vmap().
>>>> + */
>>>> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
>>>> *map); +
>>>>    /**
>>>>     * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>>>>     *
>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>> --- a/include/linux/dma-buf-map.h
>>>> +++ b/include/linux/dma-buf-map.h
>>>> @@ -45,6 +45,12 @@
>>>>     *
>>>>     *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>     *
>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>>> + *
>>>> + * .. code-block:: c
>>>> + *
>>>> + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>> + *
>>>>     * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>>     * dma_buf_map_is_null().
>>>>     *
>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>>> dma_buf_map *map, void *vaddr) map->is_iomem = false;
>>>>    }
>>>> +/**
>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>>> an address in I/O memory
>>>> + * @map:		The dma-buf mapping structure
>>>> + * @vaddr_iomem:	An I/O-memory address
>>>> + *
>>>> + * Sets the address and the I/O-memory flag.
>>>> + */
>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>>> +					       void __iomem
>>>> *vaddr_iomem) +{
>>>> +	map->vaddr_iomem = vaddr_iomem;
>>>> +	map->is_iomem = true;
>>>> +}
>>>> +
>>>>    /**
>>>>     * dma_buf_map_is_equal - Compares two dma-buf mapping structures for
>>>> equality
>>>>     * @lhs:	The dma-buf mapping structure
>
>

