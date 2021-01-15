Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646072F7C2E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388422AbhAONKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732438AbhAONKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:10:30 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC218C061799
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 05:09:49 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id n26so13187985eju.6
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pgCoV5aHb0L+p8XfllG2U0exllvT16j+0//NQwhT+p4=;
        b=NX9tyGwBDJ1VbkEbCDy9bBK+z6Y6u515MmhSgVUGh8tld9t1IoUK2W5Zj0Wh2FEdJP
         wHaATirWX3GwlkwmB43aOPJc1ADJ0V05v2dJCrTwTQX6MAz/l0ojwWKGFFJ9iMtkLOyR
         FfJTQqhXZDZ84ttFnYPmSRklQG9mveFHPvPsSrfF0Q/1XNCRWODEv24d34gc0zlWwEg9
         7ZaAej20JucABTrfFuWh9NoTm9vQhZm4dWVaM25UrzzlAHm2seESMH5tdJ9z7bdilN5D
         aGcNu6W59RE2ksSdefyjou53uyg76M1V8eRL6qWmzNSgqPPavtEXA1m6KSrWCAewlg43
         Cy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=pgCoV5aHb0L+p8XfllG2U0exllvT16j+0//NQwhT+p4=;
        b=SDUZePnjwp4KRsaGDeXGc+B5wSmbGOIUxjrPa7+DV1agxSEIKdrPZF2m8tjsQg/IYr
         cynGpTsAx++UGqvb1am0565yx+kVgDpD8zzmtPfMcuFpfB5iV3UkXVEKf5usmYWrXUp2
         p6VvL3q0VvmdEMHLeDqF2DDIlQlI8OM2K7iHsBH/uZGZqEAqloZpyJQh7ZYRD3D7iPFk
         2GAsgXDEA1GKk9KMYNagc/sOQ051OKlXNUdoyyiiS9EmBuM3sWdPgvK8H/4Rh7zlLU0R
         i2Jw1PTKz6xkNpm24xGOj3WwbL7ZN5LErW3dRJGFu8WikdND7Fs8N3Iw7NizJSllVQpt
         14AA==
X-Gm-Message-State: AOAM533zl/h6c12rwPpQYEnKKcrfeXTJV6MaCOmamb7Lb4NwhGz0nANr
        XcLLtV5p91YNrk8HPF4xBd4xUiQbCQE=
X-Google-Smtp-Source: ABdhPJzAydBw6nUSweXjn1PYgc2jFbYSLUOx8wtWpFju1Emu/08RwluD2kaHkakNIL8CAYEgla80aA==
X-Received: by 2002:a17:906:f98e:: with SMTP id li14mr8990194ejb.415.1610716188417;
        Fri, 15 Jan 2021 05:09:48 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id u9sm780680ejc.57.2021.01.15.05.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 05:09:47 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH] drm-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     linaro-mm-sig@lists.linaro.org,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8c60b2ac-d1b9-ffde-ad6d-2a3953f519de@gmail.com>
Date:   Fri, 15 Jan 2021 14:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.01.21 um 14:02 schrieb Daniel Vetter:
> We have too many people abusing the struct page they can get at but
> really shouldn't in importers. Aside from that the backing page might
> simply not exist (for dynamic p2p mappings) looking at it and using it
> e.g. for mmap can also wreak the page handling of the exporter
> completely. Importers really must go through the proper interface like
> dma_buf_mmap for everything.
>
> I'm semi-tempted to enforce this for dynamic importers since those
> really have no excuse at all to break the rules.
>
> Unfortuantely we can't store the right pointers somewhere safe to make
> sure we oops on something recognizable, so best is to just wrangle
> them a bit by flipping all the bits. At least on x86 kernel addresses
> have all their high bits sets and the struct page array is fairly low
> in the kernel mapping, so flipping all the bits gives us a very high
> pointer in userspace and hence excellent chances for an invalid
> dereference.
>
> v2: Add a note to the @map_dma_buf hook that exporters shouldn't do
> fancy caching tricks, which would blow up with this address scrambling
> trick here (Chris)
>
> Enable by default when CONFIG_DMA_API_DEBUG is enabled.
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Stevens <stevensd@chromium.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/dma-buf/Kconfig   |  8 +++++++
>   drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++----
>   include/linux/dma-buf.h   |  6 +++++
>   3 files changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 4f8224a6ac95..4e16c71c24b7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
>   	  This is marked experimental because we don't yet have a consistent
>   	  execution context and memory management between drivers.
>   
> +config DMABUF_DEBUG
> +	bool "DMA-BUF debug checks"
> +	default y if DMA_API_DEBUG
> +	help
> +	  This option enables additional checks for DMA-BUF importers and
> +	  exporters. Specifically it validates that importers do not peek at the
> +	  underlying struct page when they import a buffer.
> +
>   config DMABUF_SELFTESTS
>   	tristate "Selftests for the dma-buf interfaces"
>   	default n
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1c9bd51db110..6e4725f7dfde 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_put);
>   
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> +				       enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +
> +	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +
> +#if CONFIG_DMABUF_DEBUG
> +	if (sg_table) {
> +		int i;
> +		struct scatterlist *sg;
> +
> +		/* To catch abuse of the underlying struct page by importers mix
> +		 * up the bits, but take care to preserve the low SG_ bits to
> +		 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> +		 * before passing the sgt back to the exporter. */
> +		for_each_sgtable_sg(sg_table, sg, i)
> +			sg->page_link ^= ~0xffUL;
> +	}
> +#endif
> +
> +	return sg_table;
> +}
> +
>   /**
>    * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.
> @@ -737,7 +761,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   				goto err_unlock;
>   		}
>   
> -		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
>   		if (!sgt)
>   			sgt = ERR_PTR(-ENOMEM);
>   		if (IS_ERR(sgt)) {
> @@ -784,6 +808,23 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_attach);
>   
> +static void __unmap_dma_buf(struct dma_buf_attachment *attach,
> +			    struct sg_table *sg_table,
> +			    enum dma_data_direction direction)
> +{
> +
> +#if CONFIG_DMABUF_DEBUG
> +	if (sg_table) {
> +		int i;
> +		struct scatterlist *sg;
> +
> +		for_each_sgtable_sg(sg_table, sg, i)
> +			sg->page_link ^= ~0xffUL;
> +	}
> +#endif

Instead of duplicating this I would rather structure the code so that we 
have a helper to mangle the sgt when necessary.

This can then be called from both the map() as well as the unmap() path.

Apart from that looks good to me,
Christian.

> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +}
> +
>   /**
>    * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>    * @dmabuf:	[in]	buffer to detach from.
> @@ -802,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
> -		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
> +		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_buf_unpin(attach);
> @@ -924,7 +965,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		}
>   	}
>   
> -	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +	sg_table = __map_dma_buf(attach, direction);
>   	if (!sg_table)
>   		sg_table = ERR_PTR(-ENOMEM);
>   
> @@ -987,7 +1028,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_assert_held(attach->dmabuf->resv);
>   
> -	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +	__unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 628681bf6c99..efdc56b9d95f 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -154,6 +154,12 @@ struct dma_buf_ops {
>   	 * On failure, returns a negative error value wrapped into a pointer.
>   	 * May also return -EINTR when a signal was received while being
>   	 * blocked.
> +	 *
> +	 * Note that exporters should not try to cache the scatter list, or
> +	 * return the same one for multiple calls. Caching is done either by the
> +	 * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
> +	 * of the scatter list is transferred to the caller, and returned by
> +	 * @unmap_dma_buf.
>   	 */
>   	struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
>   					 enum dma_data_direction);

