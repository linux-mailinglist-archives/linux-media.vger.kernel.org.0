Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8D293D7A
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 15:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407555AbgJTNjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 09:39:54 -0400
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:45376
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407535AbgJTNjy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 09:39:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNLmLQEq2ogaJb89Y7a0DoyHU1dpu0akxG+g6Lj3M1spJtdg4xUXT5u3DWnog8xuhb4mHcDe4B5eFCGXwk7BJwkmsteVPmtz8Xy14cT6hiyaef0+Ih8M+CI7gxcp/vigxscIeESdvtqC/NiItwG6DJMLpl8iEU/1XU9puM/RCi+lRd0+TESk+HHMTxv3IcLZgaABA7GUj6CnDSJ5br8UhIz/+61FlhwrTRGmp0qD85QP/DCwd27VGkvji07Lf4kuzGv6aYDSDXX7cX7DjTct/gVg7/gwYUPM4KLrnUOH+4PNEcqO6EeHf0HylBajJD3a2uWq3SQGlQWX/usw5Kgmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cV8pVoP5z/fZz9XlAM66A4AVF1LwjqpED/6cqT1bI0=;
 b=CF240AmTPyDLWPLu3UPZ6ztQkl+vBNIRlafeSeiWU99XWWG8GF5w2+fn/m4TTecGNkyMLU34gotif7/5R8w4R1njtniZMmi6FeBNphabS+mrI3Uolm4ZrK/v9CglqjI/Gd9VYAacbdtWsyagqRdAwHmtlAnhdsd8TrqaJgfJTZmKRM2LqfaXmJphJ4F5AcSJr1EF+cuIpUux7r4TkPiV8/Ah0CoCkZPr9LeSktuSSkvIKoWhV2HzTRoBx0+hX8Hv/qd1T7wecnXYeIs65OJXv8B8rj409hoZ9oE/Khx2hT1q+1pF8wvVQwHqaJagXhEqGkgDmsJpNxaPz9scK07yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cV8pVoP5z/fZz9XlAM66A4AVF1LwjqpED/6cqT1bI0=;
 b=sNC0fNgcvJAL/2ngyx/k7DGHYrof8M4TBS9HwyJ/L6b8U0Kvvrt8MUGhR3rZPI2uKITS94I0vsHU/aHAaKcUXSez75ZRLT+G7LDytUAJ/W3lIvnTD6fFw7qy1CDP8hqCraXBPH3lRRVMpn/fJf1CNkEE+aUiv1HVO0uUa9HOp6A=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 20 Oct
 2020 13:39:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 13:39:50 +0000
Subject: Re: [PATCH v5 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
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
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-6-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0d936127-ff9b-ace1-97b8-bdbc01921a65@amd.com>
Date:   Tue, 20 Oct 2020 15:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020122046.31167-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR01CA0137.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 13:39:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43684d1a-3b9c-422c-7318-08d874fd9dc0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB435723291B1DCFBCFEB8E74F831F0@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvusYaEJ9X1ocSxHJDO7zzVLFArw/xLRGeFQXXgs7ue5Et0DBV4W6wnP4nEGhplE0exsjKFdih5AFpaO4cRf+9cEhaztFsYxgPCeKBP5LDg4cNOhNt7VS0VvO3IEhKrN0dJ/6IvsgQx0svWkwWT4GJibLAilL+G7Hqwf4Up08W5sGYUwJfLAAMFhPdbdYxLTZEDRY+dvuGNTmZ2DdN5OER2B+NFrFk/n6r6HCq2tGMKNadvZ3nkFj68UbUjLGUNFl3ZAVYCK1DybuiQ1AUzVrLk11bX5g2ElEIDEW6u6V58rS0mACUKNRIcaK4AufpG34SoBgRmGIgmbUc+P3m3ztXoJb+SjtDiV31oRg97i96ghJor4+MGVk3XMmx3vHYfBg+Pz8/nKEoojK4Cm0bHc6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(7416002)(36756003)(316002)(7406005)(8676002)(31696002)(6486002)(2906002)(4326008)(16526019)(186003)(478600001)(2616005)(52116002)(8936002)(66946007)(66476007)(66556008)(83380400001)(86362001)(5660300002)(6666004)(31686004)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mqlMkNwHEJI59+/j1v0Zjx12kRVJNDKvDQwM7o75w/UVI9jURs9OzV26jg8oM+Rf24H25I+lfqn3fhn5foYIhnEuRbMimlcZdeqYJJ9ASilw7SfS1zNBfdaCFiIRKNBijtbmkB57WJ2KWCY/Zrwkqy1eNrP/UBWH4SX/j5jbosrwpOZ8MRDGDqTo8QM/r1ccqcaluycGIq6v9x7aBvLwX4RqoyNeTpu4d0zB/SNzd+sE8OUuyQ8uIxidM09wPZXMSxSB/a00xnuu3g7iS9+QSFfICP/PbPbZcOhs/OlEeD58RoJcY9FiN++KGkVOLwhJRIrU1nitJXeNpkAmDZ53qInJQuDzkr6fREoVPokUN6itjq8B1ZuzC6bCDTUaTfda4EUKv4vmEUosOh4k3w9Q4T+LA1Uu9lnz8VkkI7fCjrozJ06tIfG6auK6IOs2Z79VclTFZEz5OijRM72378deskaBNn1aRZgs5FUgrjFlXIFkf6jEidr3yR7FMLb8O4fNa+UxBdRk/DKkxcjD14rcmXHj1b+9sOYlM2MSOeboPlYzlxTOGU1kyWPibQWR8crb1OHtzAqy+w7N3MZVjovknQTnMfB9f1irm83sgHEbYKbGK+Yc9gE6DKOlK2rF3JTUVRflMd8NQ2zY3bUcwcZharKy/+hCcZ6iUXmgDLmOsrisAmAvE+qRM91VTSQ7VGuUX6TcdlZrSuyzxFQnILrb5g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43684d1a-3b9c-422c-7318-08d874fd9dc0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 13:39:50.1814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8RgvKt9S4Nq3RhDPJfN3dHb/5uTiTRNW42pC37NdmMjd5S95Q3zNocaKAgu3yIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.10.20 um 14:20 schrieb Thomas Zimmermann:
> The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in kernel
> address space. The mapping's address is returned as struct dma_buf_map.
> Each function is a simplified version of TTM's existing kmap code. Both
> functions respect the memory's location ani/or writecombine flags.
>
> On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
> two helpers that convert a GEM object into the TTM BO and forward the call
> to TTM's vmap/vunmap. These helpers can be dropped into the rsp GEM object
> callbacks.
>
> v5:
> 	* use size_t for storing mapping size (Christian)
> 	* ignore premapped memory areas correctly in ttm_bo_vunmap()
> 	* rebase onto latest TTM interfaces (Christian)
> 	* remove BUG() from ttm_bo_vmap() (Christian)
> v4:
> 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers (Daniel,
> 	  Christian)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Tested-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
>   drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
>   include/drm/drm_gem_ttm_helper.h     |  6 +++
>   include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
>   include/linux/dma-buf-map.h          | 20 ++++++++
>   5 files changed, 164 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
> index 0e4fb9ba43ad..db4c14d78a30 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
>   }
>   EXPORT_SYMBOL(drm_gem_ttm_print_info);
>   
> +/**
> + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
> + * @gem: GEM object.
> + * @map: [out] returns the dma-buf mapping.
> + *
> + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
> + * &drm_gem_object_funcs.vmap callback.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> +		     struct dma_buf_map *map)
> +{
> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> +
> +	return ttm_bo_vmap(bo, map);
> +
> +}
> +EXPORT_SYMBOL(drm_gem_ttm_vmap);
> +
> +/**
> + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
> + * @gem: GEM object.
> + * @map: dma-buf mapping.
> + *
> + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used as
> + * &drm_gem_object_funcs.vmap callback.
> + */
> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> +			struct dma_buf_map *map)
> +{
> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> +
> +	ttm_bo_vunmap(bo, map);
> +}
> +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
> +
>   /**
>    * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
>    * @gem: GEM object.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ba7ab5ed85d0..5c79418405ea 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -32,6 +32,7 @@
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/drm_vma_manager.h>
> +#include <linux/dma-buf-map.h>
>   #include <linux/io.h>
>   #include <linux/highmem.h>
>   #include <linux/wait.h>
> @@ -527,6 +528,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>   }
>   EXPORT_SYMBOL(ttm_bo_kunmap);
>   
> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> +{
> +	struct ttm_resource *mem = &bo->mem;
> +	int ret;
> +
> +	ret = ttm_mem_io_reserve(bo->bdev, mem);
> +	if (ret)
> +		return ret;
> +
> +	if (mem->bus.is_iomem) {
> +		void __iomem *vaddr_iomem;
> +		size_t size = bo->num_pages << PAGE_SHIFT;
> +
> +		if (mem->bus.addr)
> +			vaddr_iomem = (void __iomem *)mem->bus.addr;
> +		else if (mem->bus.caching == ttm_write_combined)
> +			vaddr_iomem = ioremap_wc(mem->bus.offset, size);
> +		else
> +			vaddr_iomem = ioremap(mem->bus.offset, size);
> +
> +		if (!vaddr_iomem)
> +			return -ENOMEM;
> +
> +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> +
> +	} else {
> +		struct ttm_operation_ctx ctx = {
> +			.interruptible = false,
> +			.no_wait_gpu = false
> +		};
> +		struct ttm_tt *ttm = bo->ttm;
> +		pgprot_t prot;
> +		void *vaddr;
> +
> +		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * We need to use vmap to get the desired page protection
> +		 * or to make the buffer object look contiguous.
> +		 */
> +		prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
> +		vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
> +		if (!vaddr)
> +			return -ENOMEM;
> +
> +		dma_buf_map_set_vaddr(map, vaddr);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_vmap);
> +
> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> +{
> +	struct ttm_resource *mem = &bo->mem;
> +
> +	if (dma_buf_map_is_null(map))
> +		return;
> +
> +	if (!map->is_iomem)
> +		vunmap(map->vaddr);
> +	else if (!mem->bus.addr)
> +		iounmap(map->vaddr_iomem);
> +	dma_buf_map_clear(map);
> +
> +	ttm_mem_io_free(bo->bdev, &bo->mem);
> +}
> +EXPORT_SYMBOL(ttm_bo_vunmap);
> +
>   static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
>   				 bool dst_use_tt)
>   {
> diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm_helper.h
> index 118cef76f84f..7c6d874910b8 100644
> --- a/include/drm/drm_gem_ttm_helper.h
> +++ b/include/drm/drm_gem_ttm_helper.h
> @@ -10,11 +10,17 @@
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   
> +struct dma_buf_map;
> +
>   #define drm_gem_ttm_of_gem(gem_obj) \
>   	container_of(gem_obj, struct ttm_buffer_object, base)
>   
>   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
>   			    const struct drm_gem_object *gem);
> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> +		     struct dma_buf_map *map);
> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> +			struct dma_buf_map *map);
>   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>   		     struct vm_area_struct *vma);
>   
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 37102e45e496..2c59a785374c 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -48,6 +48,8 @@ struct ttm_bo_global;
>   
>   struct ttm_bo_device;
>   
> +struct dma_buf_map;
> +
>   struct drm_mm_node;
>   
>   struct ttm_placement;
> @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>    */
>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>   
> +/**
> + * ttm_bo_vmap
> + *
> + * @bo: The buffer object.
> + * @map: pointer to a struct dma_buf_map representing the map.
> + *
> + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> + * data in the buffer object. The parameter @map returns the virtual
> + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap().
> + *
> + * Returns
> + * -ENOMEM: Out of memory.
> + * -EINVAL: Invalid range.
> + */
> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> +
> +/**
> + * ttm_bo_vunmap
> + *
> + * @bo: The buffer object.
> + * @map: Object describing the map to unmap.
> + *
> + * Unmaps a kernel map set up by ttm_bo_vmap().
> + */
> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> +
>   /**
>    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>    *
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index fd1aba545fdf..2e8bbecb5091 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -45,6 +45,12 @@
>    *
>    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>    *
> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> + *
>    * Test if a mapping is valid with either dma_buf_map_is_set() or
>    * dma_buf_map_is_null().
>    *
> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
>   	map->is_iomem = false;
>   }
>   
> +/**
> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an address in I/O memory
> + * @map:		The dma-buf mapping structure
> + * @vaddr_iomem:	An I/O-memory address
> + *
> + * Sets the address and the I/O-memory flag.
> + */
> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> +					       void __iomem *vaddr_iomem)
> +{
> +	map->vaddr_iomem = vaddr_iomem;
> +	map->is_iomem = true;
> +}
> +
>   /**
>    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
>    * @lhs:	The dma-buf mapping structure

