Return-Path: <linux-media+bounces-3647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C782C09E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 14:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FCF1F24A36
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 13:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B436D1A2;
	Fri, 12 Jan 2024 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cqxFlnPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745B5917D
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7e6239e1so1729402e87.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 05:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705065215; x=1705670015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7MESFOqMbldu0jdAkEUCRW758Po4BcRceiIfnJUgcs=;
        b=cqxFlnPHO69LD5aTtyfALGvzCdylQeOlaDJqKQ25mmtOm+glkX5AlnMaR91YulZqth
         b802txLb1lYec96a1xwbfjwh3jGO0WIw2uTy/oWZsM0V+WwVYIVpfWZCduM8e8zwQ9No
         pP1jk4ZUA31ion7LYMuAnA4zs3+2v4NY+f0ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705065215; x=1705670015;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7MESFOqMbldu0jdAkEUCRW758Po4BcRceiIfnJUgcs=;
        b=oAOtj2X5dNVbhfKSnCqb8X+/J5961p19oE+lEDdAukWPkH2ekF4Mj8+dS2o3E+g1sf
         MOPSH5zwAsW4YpFYRSQjGFSuU3gP/G7LiYhVqSLacU5qM3eixDqeznmmWR8DwN6eQKx9
         /6I/ytJ8B32xqadLzzDRk7XojqFppbZS3ilE/PLW11rEs45/YNVRSoM3zvbUp/HbkiSC
         Ggx8nbrYofSVYI5/awEO+euSYa4CxH9OOQOzJUvr4w/WQa5bsdhpv012Ur7xcduxSbMU
         G3ceVO4TZDevfF083Rg39awTCAVE+vZmHADKj9ZzP52aR7el4K+HUPuD+0ofUI8C2uUJ
         dQwQ==
X-Gm-Message-State: AOJu0YxavtnWUZSQKNZVUT7mc6bo5M7loplkQr/qUcZIPpeQBZbzhuyC
	ztWlglAoC7SLU/NfZhGWIxXLmaRj7QM/Rw==
X-Google-Smtp-Source: AGHT+IGDocnKA5u5Ry/6tcJ2qWsqvkAYYFcoQDwE3LVjDtNYc/uY2Ce4syB0oTLhh+z+YdT5+6GIXg==
X-Received: by 2002:a19:8c4a:0:b0:50e:84f9:22dc with SMTP id i10-20020a198c4a000000b0050e84f922dcmr1041071lfj.2.1705065214674;
        Fri, 12 Jan 2024 05:13:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x25-20020a1709064bd900b00a28f54aacf1sm1789075ejv.185.2024.01.12.05.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 05:13:34 -0800 (PST)
Date: Fri, 12 Jan 2024 14:13:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Singo Chang <singo.chang@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Shawn Sung <shawn.sung@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 03/11] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Message-ID: <ZaE6_I95IcxIUB4x@phenom.ffwll.local>
Mail-Followup-To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Singo Chang <singo.chang@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Shawn Sung <shawn.sung@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
 <20231223182932.27683-4-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231223182932.27683-4-jason-jh.lin@mediatek.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Sun, Dec 24, 2023 at 02:29:24AM +0800, Jason-JH.Lin wrote:
> Add secure buffer control flow to mtk_drm_gem.
> 
> When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
> to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
> dma buffer from secure dma-heap and bind it to mtk_drm_gem object.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Apologies for jumping rather late, but last year was a mess here.

There's the fundamental issue that this is new uapi, and it needs open
userspace, and I haven't seen that.

What's more, this is a pure kms api so there's no precedent at all for
adding special ioctl to those - all the existing support for
protected/restricted content buffers in upstream has used render nodes and
EGL_EXT_protected_content in mesa3d to enable this feature on the drm/kms
side. So I'm not exactly sure what your plan here is, but you need one,
and it needs to be more than a testcase/demo.

The other issue, and the reason I've looked into the mtk code, is that the
dma-buf implementation breaks the dma-buf api. So that needs to be
changed.

Finally I think the primary way to display a protected content buffer on a
pure kms driver should be by using prime fd2handle buffer importing.
Because you're adding a dma-buf heap it's already possible for userspace
to use this path (or at least try), and so we have to make this path work
anyway.

Once we have the prime import path working correctly for protected content
buffers (which should shake out all the dma-api issues I've explained in
the dma-buf heaps thread), it should be possible to implement the direct
allocation function in a generic helper:

struct drm_gem_object * drm_gem_create_object_from_heap(struct drm_device *dev,
							struct drm_file *file,
							struct drm_buf_heap *heap);

Which does roughly:

- allocate a dma-buf from the desired heap
- import that dma-buf into the device using prime for the drm_file
- using the already implemented driver import code for special cases like
  protected content buffers

There should be no need to hand-roll all this code here, and especially
not have any special-casing for the heap string name or things like that.
That all must be handled in the dma-buf prime import code.

Cheers, Sima

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 85 +++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 30e347adcbe9..858f34a735f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -4,6 +4,8 @@
>   */
>  
>  #include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <uapi/linux/dma-heap.h>
>  #include <drm/mediatek_drm.h>
>  
>  #include <drm/drm.h>
> @@ -55,6 +57,81 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  	return mtk_gem_obj;
>  }
>  
> +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
> +						     const char *heap, size_t size)
> +{
> +	struct mtk_drm_private *priv = dev->dev_private;
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	struct drm_gem_object *obj;
> +	struct dma_heap *dma_heap;
> +	struct dma_buf *dma_buf;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	struct iosys_map map = {};
> +	int ret;
> +
> +	mtk_gem = mtk_drm_gem_init(dev, size);
> +	if (IS_ERR(mtk_gem))
> +		return ERR_CAST(mtk_gem);
> +
> +	obj = &mtk_gem->base;
> +
> +	dma_heap = dma_heap_find(heap);
> +	if (!dma_heap) {
> +		DRM_ERROR("heap find fail\n");
> +		goto err_gem_free;
> +	}
> +	dma_buf = dma_heap_buffer_alloc(dma_heap, size,
> +					O_RDWR | O_CLOEXEC, DMA_HEAP_VALID_HEAP_FLAGS);
> +	if (IS_ERR(dma_buf)) {
> +		DRM_ERROR("buffer alloc fail\n");
> +		dma_heap_put(dma_heap);
> +		goto err_gem_free;
> +	}
> +	dma_heap_put(dma_heap);
> +
> +	attach = dma_buf_attach(dma_buf, priv->dma_dev);
> +	if (IS_ERR(attach)) {
> +		DRM_ERROR("attach fail, return\n");
> +		dma_buf_put(dma_buf);
> +		goto err_gem_free;
> +	}
> +
> +	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		DRM_ERROR("map failed, detach and return\n");
> +		dma_buf_detach(dma_buf, attach);
> +		dma_buf_put(dma_buf);
> +		goto err_gem_free;
> +	}
> +	obj->import_attach = attach;
> +	mtk_gem->dma_addr = sg_dma_address(sgt->sgl);
> +	mtk_gem->sg = sgt;
> +	mtk_gem->size = dma_buf->size;
> +
> +	if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
> +		/* secure buffer can not be mapped */
> +		mtk_gem->secure = true;
> +	} else {
> +		ret = dma_buf_vmap(dma_buf, &map);
> +		mtk_gem->kvaddr = map.vaddr;
> +		if (ret) {
> +			DRM_ERROR("map failed, ret=%d\n", ret);
> +			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +			dma_buf_detach(dma_buf, attach);
> +			dma_buf_put(dma_buf);
> +			mtk_gem->kvaddr = NULL;
> +		}
> +	}
> +
> +	return mtk_gem;
> +
> +err_gem_free:
> +	drm_gem_object_release(obj);
> +	kfree(mtk_gem);
> +	return ERR_PTR(-ENOMEM);
> +}
> +
>  struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
>  					   size_t size, bool alloc_kmap)
>  {
> @@ -225,7 +302,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
>  	if (IS_ERR(mtk_gem))
>  		return ERR_CAST(mtk_gem);
>  
> +	mtk_gem->secure = !sg_page(sg->sgl);
>  	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
> +	mtk_gem->size = attach->dmabuf->size;
>  	mtk_gem->sg = sg;
>  
>  	return &mtk_gem->base;
> @@ -301,7 +380,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct drm_mtk_gem_create *args = data;
>  	int ret;
>  
> -	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
> +		mtk_gem = mtk_drm_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
> +	else
> +		mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +
>  	if (IS_ERR(mtk_gem))
>  		return PTR_ERR(mtk_gem);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> index 90f3d2916ec5..8fd5ce827d4f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -27,9 +27,11 @@ struct mtk_drm_gem_obj {
>  	void			*cookie;
>  	void			*kvaddr;
>  	dma_addr_t		dma_addr;
> +	size_t			size;
>  	unsigned long		dma_attrs;
>  	struct sg_table		*sg;
>  	struct page		**pages;
> +	bool			secure;
>  };
>  
>  #define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
> @@ -37,6 +39,8 @@ struct mtk_drm_gem_obj {
>  void mtk_drm_gem_free_object(struct drm_gem_object *gem);
>  struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
>  					   bool alloc_kmap);
> +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
> +						     const char *heap, size_t size);
>  int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>  			    struct drm_mode_create_dumb *args);
>  struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
> -- 
> 2.18.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

