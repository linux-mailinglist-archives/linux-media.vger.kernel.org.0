Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CBD2759EC
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 16:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIWO1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 10:27:22 -0400
Received: from mail-dm6nam08on2051.outbound.protection.outlook.com ([40.107.102.51]:16224
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726504AbgIWO1W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 10:27:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1X//5P65KqsdPzbuufxsTymxR68wjTKsLp73vcs8JkRTmS4sD7v+ouChOu3kVFQb/VA+NihzPp7O8ik4uieEtPhaEhxBpkXFhMlJam7LqXm01F3xDbpd5EmxPfjmZSk5I607NX0vuN8Y+RBbPpVZQN6ysRznqP8srI/RzBCEwrLkRgIsySodgHM2mkpZNuZsMHbVwj9YPRv6OGEGdQLmJwwZcAVo4NqR37eGW7WFgrwmc+q0U8cUbmCYMqoAb45xnvUsaP5t8deeWWiEcu1DcTs51u9XvZ+WnclP4S8/2iiNgUCzZPNCvlduUrS/6wtLeEgdrrYsi1vkaWIZUaSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXYH/XK1LbUCphlMNfz9ZzJLkhCWtBAomROCVZiT4c=;
 b=SkEa0WgINmHLMa4022IIl3VJhDX6p3PxH9Dr4LWBcStEMZ3K0pzNiFvGtZI6sZqpXv5QPg1/GTwD102KLTUIhJW/n+H+nHGKQnqYC7eqkELaCF7WqlUD90NeIxyf1JGC2IBcuuUBrDLFyUn6NwNEQ7eiW4I2DWDH99QK1tZTkuA08s175eFI8wW1U/LdcGGPltsBJUXCFiEmnQFjfzBc91OMPK4r4Z0ISx5CpCHlhLuNy/OlYlU059z51LSSRVTJJet3YcJmUwbdnfSqKRIhQ5rDwvyzgP5upbQo1IxS/AcKok2Pb+G/Pv4i9GRpRXnvBWChCeG3Mqg2d3oerBUsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXYH/XK1LbUCphlMNfz9ZzJLkhCWtBAomROCVZiT4c=;
 b=TXWYWObNqhuXzw7jBV3RLFZcJdSnwVijYNL7ID4oW/IOHSROihJyoVckfWXTZBNvv9yfyYWQiVMeECc/TIsoOZzh9d1hq4IYV8T4UcX6nQuShu0Rr9dmSeid7hrDOK1/jHqnhn1a8PVdWuwShoWXx7eGwwslnq3LnUVxyLXH2Ow=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:27:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:27:16 +0000
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing struct
 dma_buf.vaddr_ptr
To:     Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
        afd@ti.com, corbet@lwn.net, benjamin.gaignard@linaro.org,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        john.stultz@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
        m.szyprowski@samsung.com, kyungmin.park@samsung.com,
        tfiga@chromium.org, mchehab@kernel.org, matthew.auld@intel.com,
        robin.murphy@arm.com, thomas.hellstrom@intel.com, sam@ravnborg.org,
        kraxel@redhat.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
Date:   Wed, 23 Sep 2020 16:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923123205.30671-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 14:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c661b9fd-a0e8-4f63-dd7d-08d85fccc53e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549F3F5D665B5651028330383380@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPugTbrBBSNXya66m+Lb5EUXaR5uGbOCRf0waWV5tTuc6SQR/yC4GxduCMP6eo59vwAG4q7BzWXWdc8AQMOJXSIp6BNk1CoFsALyhQDFno2knBd+KKfIVezoz1iYzj3UCI/VJheKPxYfQoTYZor3/mUijzE8wOrXXmTwe+eH/c8qGfTtvdURZ6BKVbTs18T+8nvfif70WBbVOnr5XowWhUdZozXshHUulmb32lJkcIxlI3cYG3F8pzOo4eZtlAaHdej1PefrWZ6TNOdcy2OZ3xegxKkjQSi309Zkqmp767ZiGglHsaOATVY2YUjLgQNAWSKwFb23Stcvy2031qDWxoooJ8FF8UZonmu6auk2T4oefMwbt9GKTwvL5gG/+NfRZi0GeTXz50wNlqQH22sS7QlgkzEZOakqj6tGB7YW+AjGs0cETV9z272MQZlTT4KnoxEFxmnVez1Wj38XCwRTqQiaqrWZEdPk78IISmFjVKAI1YRat/IOleiu1IVYlER5TsPKf+Aki1qpRUwv0WtgvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(66574015)(8936002)(52116002)(66476007)(316002)(7406005)(7416002)(66556008)(66946007)(4326008)(8676002)(478600001)(6666004)(6486002)(966005)(16526019)(2616005)(186003)(36756003)(2906002)(45080400002)(31686004)(5660300002)(86362001)(83380400001)(31696002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: UmuEnI9s+zF65p6wRtgZ4ObO4hvZZtLdgF9+yEYIOthYnduYIIU3x1PwdgTD68d8FGXDth2gIl9TBsUrpJQUbz1xRgcCPUJO/kI7rtDBxSlFxmZwHKDY3bjfxHtD3Q2YP+soAjXRweTEEXEVzHNgt31WfOK0ga1lFHvmkfh6wQyxywCHafE6Mt4QeDBQEAWF3NbIi/pVX0oAuKU8mhTrUUVXIfKvCiRNSqSOJrHjipZfssmbvzk+BDyiH7SnghtZxN34HkMbtkCBsJYUjwW4ZJR23AoiV0T2RKzHqkowvRPJ/64N1GXbbYNtJGE6g/+4xLnU8XW75bHDYjlIEDEAMpOpBVnGsLJGZSxXFuKAnyN/LY/e7oc5M/VNHCeqooxTizxZRa3MlWKOTsz1A3xWnSHQLVaRQilbszJ10Z/sCC4qcEWUnk3zrET5+o1nOcx01imiIpOUD8gkRzPhUMMCTMtkOqeayjusSJjD2A8HZSXjxsxilcOorpRDJTDbnbxmNfWpZ2fS2pVeBLG/nLu4vEUohSbrn5sGD7xOdpkaYWQto9HHxMwmo2oezj5v3IVkrBwz5MUjfIqicwB7Mm5zu9xCsKMXzn8bFMjQU6RIu5BcsZfm0ohi17hVBNk9+h9V8GPejQukk1JhWVmsrXEZm8aOQEkUAdRPmwdUItYpGwtna4UBVwjuboYe9BrM5ZrJFy9Furacakao4/Mt/JgMow==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c661b9fd-a0e8-4f63-dd7d-08d85fccc53e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:27:16.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frsM6rtND0ARZimtYaNIwLddoVbGfdgpQq/EHmoSu6l+JR/c/peobcBZdxuy1/TE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 23.09.20 um 14:32 schrieb Thomas Zimmermann:
> The new type struct dma_buf_map represents a mapping of dma-buf memory
> into kernel space. It contains a flag, is_iomem, that signals users to
> access the mapped memory with I/O operations instead of regular loads
> and stores.
>
> It was assumed that DMA buffer memory can be accessed with regular load
> and store operations. Some architectures, such as sparc64, require the
> use of I/O operations to access dma-map buffers that are located in I/O
> memory. Providing struct dma_buf_map allows drivers to implement this.
> This was specifically a problem when refreshing the graphics framebuffer
> on such systems. [1]
>
> As the first step, struct dma_buf stores an instance of struct dma_buf_map
> internally. Afterwards, dma-buf's vmap and vunmap interfaces are be
> converted. Finally, affected drivers can be fixed.
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C54486b9682654f3950b808d85fbcb1d3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637364611338153209&amp;sdata=%2BZm7t8OcgkIxnY%2FdZSLhSbKC7t1y4VW5lINFKwCQv3A%3D&amp;reserved=0

Only two nit picks below, apart from that Reviewed-by: Christian König 
<christian.koenig@amd.com>

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>   Documentation/driver-api/dma-buf.rst |  3 +
>   drivers/dma-buf/dma-buf.c            | 14 ++---
>   include/linux/dma-buf-map.h          | 87 ++++++++++++++++++++++++++++
>   include/linux/dma-buf.h              |  3 +-
>   4 files changed, 99 insertions(+), 8 deletions(-)
>   create mode 100644 include/linux/dma-buf-map.h
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 13ea0cc0a3fa..3244c600a9a1 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -115,6 +115,9 @@ Kernel Functions and Structures Reference
>   .. kernel-doc:: include/linux/dma-buf.h
>      :internal:
>   
> +.. kernel-doc:: include/linux/dma-buf-map.h
> +   :internal:
> +
>   Reservation Objects
>   -------------------
>   
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 58564d82a3a2..5e849ca241a0 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1207,12 +1207,12 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
>   	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
> -		BUG_ON(!dmabuf->vmap_ptr);
> -		ptr = dmabuf->vmap_ptr;
> +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +		ptr = dmabuf->vmap_ptr.vaddr;
>   		goto out_unlock;
>   	}
>   
> -	BUG_ON(dmabuf->vmap_ptr);
> +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>   
>   	ptr = dmabuf->ops->vmap(dmabuf);
>   	if (WARN_ON_ONCE(IS_ERR(ptr)))
> @@ -1220,7 +1220,7 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
>   	if (!ptr)
>   		goto out_unlock;
>   
> -	dmabuf->vmap_ptr = ptr;
> +	dmabuf->vmap_ptr.vaddr = ptr;
>   	dmabuf->vmapping_counter = 1;
>   
>   out_unlock:
> @@ -1239,15 +1239,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
>   	if (WARN_ON(!dmabuf))
>   		return;
>   
> -	BUG_ON(!dmabuf->vmap_ptr);
> +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>   	BUG_ON(dmabuf->vmapping_counter == 0);
> -	BUG_ON(dmabuf->vmap_ptr != vaddr);
> +	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
>   
>   	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, vaddr);
> -		dmabuf->vmap_ptr = NULL;
> +		dma_buf_map_clear(&dmabuf->vmap_ptr);
>   	}
>   	mutex_unlock(&dmabuf->lock);
>   }
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> new file mode 100644
> index 000000000000..d4b1bb3cc4b0
> --- /dev/null
> +++ b/include/linux/dma-buf-map.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Pointer to dma-buf-mapped memory, plus helpers.
> + */
> +
> +#ifndef __DMA_BUF_MAP_H__
> +#define __DMA_BUF_MAP_H__
> +
> +#include <linux/io.h>
> +
> +/**
> + * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
> + * @vaddr_iomem:	The buffer's address if in I/O memory
> + * @vaddr:		The buffer's address if in system memory
> + * @is_iomem:		True if the dma-buf memory is located in I/O
> + *			memory, or false otherwise.
> + *
> + * Calling dma-buf's vmap operation returns a pointer to the buffer.
> + * Depending on the location of the buffer, users may have to access it
> + * with I/O operations or memory load/store operations. struct dma_buf_map
> + * stores the buffer address and a flag that signals the required access.
> + */
> +struct dma_buf_map {
> +	union {
> +		void __iomem *vaddr_iomem;
> +		void *vaddr;
> +	};
> +	bool is_iomem;
> +};
> +
> +/* API transition helper */
> +static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
> +{
> +	return !map->is_iomem && (map->vaddr == vaddr);
> +}
> +
> +/**
> + * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
> + * @map:	The dma-buf mapping structure
> + *
> + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> + * mapping is NULL.
> + *
> + * Returns:
> + * True if the mapping is NULL, or false otherwise.
> + */
> +static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
> +{
> +	if (map->is_iomem)
> +		return map->vaddr_iomem == NULL;
> +	return map->vaddr == NULL;

This looks like overkill since both pointers are part of the same union.

I suggest to test only one and add a comment.

> +}
> +
> +/**
> + * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
> + * @map:	The dma-buf mapping structure
> + *
> + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> + * mapping has been set.
> + *
> + * Returns:
> + * True if the mapping is been set, or false otherwise.
> + */
> +static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
> +{
> +	return !dma_buf_map_is_null(map);
> +}
> +
> +/**
> + * dma_buf_map_clear - Clears a dma-buf mapping structure
> + * @map:	The dma-buf mapping structure
> + *
> + * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
> + * mapping structures that were set to point to I/O memory are reset for
> + * system memory. Pointers are cleared to NULL. This is the default.
> + */
> +static inline void dma_buf_map_clear(struct dma_buf_map *map)
> +{
> +	if (map->is_iomem) {
> +		map->vaddr_iomem = NULL;
> +		map->is_iomem = false;
> +	} else {
> +		map->vaddr = NULL;
> +	}

Maybe just use memset() on the structure.

Christian.

> +}
> +
> +#endif /* __DMA_BUF_MAP_H__ */
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 957b398d30e5..fcc2ddfb6d18 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -13,6 +13,7 @@
>   #ifndef __DMA_BUF_H__
>   #define __DMA_BUF_H__
>   
> +#include <linux/dma-buf-map.h>
>   #include <linux/file.h>
>   #include <linux/err.h>
>   #include <linux/scatterlist.h>
> @@ -309,7 +310,7 @@ struct dma_buf {
>   	const struct dma_buf_ops *ops;
>   	struct mutex lock;
>   	unsigned vmapping_counter;
> -	void *vmap_ptr;
> +	struct dma_buf_map vmap_ptr;
>   	const char *exp_name;
>   	const char *name;
>   	spinlock_t name_lock;

